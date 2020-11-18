# frozen_string_literal: true

require 'httparty'

module Kubemq
  module Queue
    def self.add(message:, channel: 'test')
      payload = build_payload(message: message, channel: channel)
      url = "#{Kubemq::Helper.protocol}://#{Kubemq.host}:#{Kubemq.port}/queue/send"
      HTTParty.post(url, headers: Kubemq::Helper.default_content_type, body: payload)
    end

    def self.build_payload(message:, channel:)
      { "ClientId": Kubemq.client_id,
        "Channel": "#{Kubemq.namespace}.#{channel}",
        "Body": Base64.encode64(message),
        "Policy": { "ExpirationSeconds": 0,
                    "DelaySeconds": 0,
                    "MaxReceiveCount": 0,
                    "MaxReceiveQueue": '' } }.to_json
    end
  end
end
