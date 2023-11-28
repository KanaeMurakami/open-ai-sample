Rails.application.routes.draw do
  root 'top#index'
  get ':year', controller: 'top', action: 'index', constraints: { year: /\d{4}/ }
  resources :ai_fortunetelling, only: %i[new create show]
end
