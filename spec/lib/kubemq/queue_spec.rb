# frozen_string_literal: true

RSpec.describe Kubemq do
  describe 'Queue' do
    describe '.add' do
      it 'should post to queue/send' do
        payload = { message: 'test', channel: 'test' }
        stub_request(:post, "https://localhost/queue/send").
          with(
            body: Kubemq::Queue.build_payload(payload),
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Ruby'
            }).
          to_return(status: 200, body: "", headers: {})
        allow(HTTParty).to receive(:post).and_return(true)
        Kubemq::Queue.add payload
        expect(HTTParty).to have_received(:post)
      end
    end

    describe '.list' do
      before(:each) do
        Kubemq.host = 'kubemq'
        Kubemq.tls = false
      end

      after(:each) do
        Kubemq.host = 'localhost'
        Kubemq.tls = true
      end

      it 'should return a list with queues' do
        stub_request(:get, "http://kubemq:9090/queue/list").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Ruby'
           }).
          to_return(status: 200, body: "", headers: {})
        
        allow(HTTParty).to receive(:get).and_return(true)
        Kubemq::Queue.list
        expect(HTTParty).to have_received(:get)
      end
    end
  end
end
