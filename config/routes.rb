Rails.application.routes.draw do
  resources :matchplay_events, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
