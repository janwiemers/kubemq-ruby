# frozen_string_literal: true

require 'httparty'

module Kubemq
  module Queue
    def self.add(message, channel)
      payload = build_payload(message, channel)
      url = "#{Kubemq::Helper.base_url}/queue/send"
      HTTParty.post(url, headers: Kubemq::Helper.default_content_type, body: payload)
    end

    def self.list
      url = "#{Kubemq::Helper.base_url}/queue/list"
      r = HTTParty.post(url, headers: Kubemq::Helper.default_content_type)
      puts r.parsed_response
    end

    def self.build_payload(message, channel)
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
