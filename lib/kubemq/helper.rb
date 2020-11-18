# frozen_string_literal: true

module Kubemq
  module Helper
    def self.default_content_type
      { 'Content-Type' => 'application/json' }
    end

    def self.protocol
      Kubemq.tls ? 'https' : 'http'
    end

    def self.base_url
      url = "#{Kubemq::Helper.protocol}://#{Kubemq.host}:#{Kubemq.port}"
    end
  end
end
