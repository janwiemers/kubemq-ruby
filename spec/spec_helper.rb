# frozen_string_literal: true

require 'bundler/setup'
require 'active_support'
require 'webmock/rspec'
# require 'shoulda'
require 'kubemq'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Shoulda::Matchers.configure do |config|
#   config.integrate do |with|
#     with.test_framework :rspec

#     # Keep as many of these lines as are necessary:
#     with.library :active_record
#     with.library :active_model
#   end
# end