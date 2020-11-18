# frozen_string_literal: true

RSpec.describe Kubemq do
  before do
    # Kubemq.configure do |c|
    #   c.host = 'locahost'
    #   c.port = '9090'
    #   c.ssl = true
    #   c.user = ''
    #   c.password = ''
    #   c.namespace = 'test'
    #   c.client_id = 'test_client'
    # end
  end

  describe 'Default' do


    it 'should have an empty namespace' do
      expect(Kubemq.namespace).to eq('')
    end

    it 'should be tls' do
      expect(Kubemq.tls).to be_truthy
    end
  end
end
