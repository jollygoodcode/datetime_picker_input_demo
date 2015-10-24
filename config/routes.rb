Rails.application.routes.draw do
  root 'application#index'
  post '/submit_and_error' => 'application#submit_and_error'

  resources :events
end
