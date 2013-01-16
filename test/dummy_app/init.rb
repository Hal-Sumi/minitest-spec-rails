ENV['RAILS_ENV'] = 'test'
require 'rubygems'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../Gemfile', __FILE__)
require 'bundler/setup'
require 'rails/all'
Bundler.require :default, :development, :test

module Dummy
  class Application < ::Rails::Application 

    config.root = File.join __FILE__, '..'
    config.cache_store = :memory_store
    config.assets.enabled = false if Rails.version > '3.1'
    config.secret_token = '012345678901234567890123456789'

    config.whiny_nils = true if Rails.version < '4.0'
    config.consider_all_requests_local = true
    config.action_controller.perform_caching = false
    config.action_dispatch.show_exceptions = false
    config.action_controller.allow_forgery_protection = false
    config.action_mailer.delivery_method = :test
    config.active_support.deprecation = :stderr
    if Rails.version < '4.0'
      config.threadsafe!
    else
      config.allow_concurrency = true
      config.cache_classes = true
      config.dependency_loading = true
      config.preload_frameworks = true
      config.eager_load = true
      config.secret_key_base = '012345678901234567890123456789'
    end
    
  end
end

Dummy::Application.initialize!
