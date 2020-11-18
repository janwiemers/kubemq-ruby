# frozen_string_literal: true

RSpec.describe Kubemq do
  describe 'Queue' do
    it '.add' do
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
      Kubemq.host = 'localhost'
      allow(HTTParty).to receive(:post).and_return(true)
      Kubemq::Queue.add payload
      expect(HTTParty).to have_received(:post)
      # expect_any_instance_of(HTTParty).to receive(:post).and_return(true)
    end
  end
end
