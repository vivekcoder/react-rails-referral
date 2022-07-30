# frozen_string_literal: true

Rails.application.routes.draw do
  root 'books#home'
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {sessions: 'api/v1/sessions', registrations: 'api/v1/registrations'}
      resources :users, only: [] do
        collection do
          get :me
        end
      end

      resources :referrals, only: [:create]
    end
  end

  # devise_scope :user do
  #   namespace :api do
  #     namespace :v1 do
  #       resources :sessions, :only => [:create, :destroy]
  #     end
  #   end
  # end

  resources :books

  # draw :api
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
