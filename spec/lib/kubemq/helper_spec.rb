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
  end
end
