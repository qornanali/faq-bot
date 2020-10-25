class WebhooksController < ApplicationController
  def show
    mode = params['hub.mode']
    token = params['hub.verify_token']
    challenge = params['hub.challenge']

    if mode == 'subscribe' && token == Figaro.env.MESSENGER_VERIFICATION_TOKEN
      render json: challenge, status: 200
      return
    end

    render json: 'FAILED', status: 403
  end

  def create
    webhook_data = params['webhook'].as_json
    if webhook_data['object'] != 'page'
      render json: 'FAILED', status: 404
      return
    end

    entries = webhook_data['entry']
    entries.each do |entry|
      messaging = entry['messaging'].first
      question = Question.from_messenger_payload(messaging)
      answer = Answer.find_by_question_type(question.intent)
      text_for_answer = answer.present? ? answer.text : Figaro.env.UNKNOWN_ANSWER
      send_message(question.sender_id, text_for_answer)
    end
    render json: 'EVENT_RECEIVED', status: 200
  end

  private

    def send_message(sender_id, text)
      access_token = Figaro.env.MESSENGER_ACCESS_TOKEN
      request_url = URI("#{Figaro.env.FACEBOOK_GRAPH_HOST}/v2.6/me/messages?access_token=#{access_token}")
      request_body = {
        recipient: {
          id: sender_id
        },
        message: {
          text: text
        }
      }.to_json

      resp = Faraday.post(request_url, request_body, "Content-Type" => "application/json")
    end
end
