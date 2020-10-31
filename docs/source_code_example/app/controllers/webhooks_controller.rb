class WebhooksController < ApplicationController
  def show
    mode = params['hub.mode']
    token = params['hub.verify_token']
    challenge = params['hub.challenge']

    if mode == 'subscribe' && token == 'foo'
      render json: challenge, status: :ok
      return
    end

    render json: 'FAILED', status: :forbidden
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
      message = messaging['message']
      sender_id = messaging['sender']['id']
      send_message(sender_id, text_for_answer(message))
    end
    render json: 'EVENT_RECEIVED', status: 200
  end

  private

    def send_message(recipient_id, text)
      access_token = 'EAAFQYRMAXQQBANIEqVr8hWQWElPvr0VvPxryTkNGULcLnXrynrt2qwjOovFsCOp53VI2mWN6BPO7pEJisKfFJNGn38qjteAjmzoAxUVSubtQAuWcjU7fSxG60dchutpn4HvwSbi05OM5e9EaFUNhHxNogknWTMmjfLdARZCYhSdcpDT1AEbKHb2vNQEMZD' ## Be careful with this token. Don't share it to others unless you trust them.
      request_url = URI("https://graph.facebook.com/v2.6/me/messages?access_token=#{access_token}")
      request_body = {
        recipient: {
          id: recipient_id
        },
        message: {
          text: text
        }
      }.to_json

      resp = Faraday.post(request_url, request_body, "Content-Type" => "application/json")
    end

    def text_for_answer(message)
      selected_intents = message['nlp']['intents'].select { |item| item['confidence'].to_f > 0.5 }
      sorted_intents = selected_intents.sort_by { |item| -item['confidence'].to_f }
      intent = sorted_intents.first['name'] unless sorted_intents.empty?
      if intent == 'allowed_name'
        answer = Answer.find_by_question_type(intent)
        return answer.text if answer.present?
      end

      message['text']
    end
end
