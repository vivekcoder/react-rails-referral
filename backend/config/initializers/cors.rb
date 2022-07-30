# frozen_string_literal: true
Rails.application.config.middleware.insert_before Warden::Manager, Rack::Cors do
  allow do
    origins '*'
    resource '*',
    :headers => :any,
    :methods => [:get, :post, :options]
  end
end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/api/v1/*',
             headers: :any,
             methods: %i[get post patch put delete]
    resource '/users/me',
             headers: :any,
             methods: %i[get]
  end
end
