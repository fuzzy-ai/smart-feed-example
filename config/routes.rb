Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/setup', to: 'tweets#setup'

  root to: 'tweets#index'
end
