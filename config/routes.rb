require 'sidekiq/web'

Rails.application.routes.draw do
  resource :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
