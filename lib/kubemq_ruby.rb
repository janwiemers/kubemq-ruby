module KubemqRuby

  class << self
    mattr_accessor :host, :user, :password, :namespace, :client_id
  end

  def self.configure(&block)
    yield self
  end


  class Producer
    def self.send(message:, channel:)
      puts super.inspect
      payload = create_payload(message: message, channel: channel)
      url = "http://#{ENV.fetch('KUBEMQ_HOST')}/queue/send"
      result = HTTParty.post(url, headers: { 'Content-Type' => 'application/json' }, body: payload)
    end

    private

    def build_payload
      { "ClientId": ENV.fetch('KUBEMQ_CLIENT_ID'),
        "Channel": "#{ENV.fetch('KUBEMQ_CHANNEL')}.#{channel}",
        "Body": Base64.encode64(message),
        "Policy": { "ExpirationSeconds": 0,
                    "DelaySeconds": 0,
                    "MaxReceiveCount": 0,
                    "MaxReceiveQueue": '' } }.to_json
    end
  end
end