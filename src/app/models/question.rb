class Question
  attr_accessor :sender_id, :text, :intent

  def initialize(sender_id, text, intent)
    @sender_id = sender_id
    @text = text
    @intent = intent
  end

  def self.from_messenger_payload(messaging)
    message = messaging['message']
    sender_id = messaging['sender']['id']
    text = message['text']
    intents = message['nlp']['intents'].sort_by { |item| -item['confidence'].to_f }
    intent = intents.first['name'] unless intents.empty?
    new(sender_id, text, intent)
  end
end
