# frozen_string_literal: true

RSpec.describe Kubemq do
  describe 'Verison' do
    it 'should not be nil' do
      expect(Kubemq::VERSION).not_to be nil
    end
  end
end
