Rails.application.routes.draw do

  root to: 'site#landing', as: 'landing'

  get '/auth/:provider/callback', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy', as: 'signout'

end
