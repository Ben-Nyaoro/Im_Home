require 'twilio-ruby'

class TwilioClient
 attr_reader :client
def initialize
  @client = Twilio::REST::Client.new account_sid, auth_token
end

def send_text(buddy, message)
    @client.messages.create(
    body: message,
    from: '+17755149875',
    to: buddy
  )
end

private

  def account_sid
    account_sid = ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

end
