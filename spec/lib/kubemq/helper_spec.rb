# frozen_string_literal: true

RSpec.describe Kubemq do
  describe 'Helper' do
    describe '.default_content_type' do
      it 'returns application json' do
        expect(Kubemq::Helper.default_content_type).to eq({ 'Content-Type' => 'application/json' })
      end
    end

    describe '.protocol' do
      it 'returns https by default' do
        expect(Kubemq::Helper.protocol).to eq('https')
      end
      it 'returns https' do
        expect(Kubemq::Helper.protocol).to eq('https')
      end

      it 'returns http' do
        v = Kubemq.tls
        Kubemq.tls = false
        expect(Kubemq::Helper.protocol).to eq('http')
        Kubemq.tls = v
      end
    end

    describe '.base_url' do
      it 'should have a default url' do
        expect(Kubemq::Helper.base_url).to eq("https://#{Kubemq.host}:#{Kubemq.port}")
      end

      it 'should honor initializer' do
        Kubemq.host = ENV.fetch('KUBEMQ_HOST')
        Kubemq.port = ENV.fetch('KUBEMQ_PORT')
        expect(Kubemq::Helper.base_url).to eq("https://#{ENV.fetch('KUBEMQ_HOST')}:#{ENV.fetch('KUBEMQ_PORT')}")
      end
    end
  end
end
