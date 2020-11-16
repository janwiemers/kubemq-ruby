module Kubemq
  module Helper
    def self.default_content_type
      { 'Content-Type' => 'application/json' }
    end

    def self.protocol
      Kubemq.ssl ? 'https' : 'http'
    end
  end
end