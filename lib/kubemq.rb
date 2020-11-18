# frozen_string_literal: true
require 'active_support'
require 'kubemq/queue'
require 'kubemq/helper'
require 'kubemq/version'

module Kubemq
  class << self
    mattr_accessor :host, default: 'localhost'
    mattr_accessor :port, default: 9090
    mattr_accessor :user, default: nil
    mattr_accessor :password, default: nil
    mattr_accessor :tls, default: true
    mattr_accessor :namespace, default: ''
    mattr_accessor :client_id, default: nil

  end

  def self.configure
    defaults
    yield self
  end

  def self.defaults
    self.tls = true
  end
end
