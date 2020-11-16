require 'kubemq/queue'
require 'kubemq/helper'

module Kubemq

  class << self
    mattr_accessor :ssl, :host, :port, :user, :password, :namespace, :client_id
  end

  def self.configure(&block)
    yield self
  end

  def self.test
    puts host
    puts user
    puts password
    puts namespace
    puts client_id
  end 
end