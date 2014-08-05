Rails.application.routes.draw do

  get 'selfie/index'

  get 'selfie/new'

  get 'selfie/create'

  root to: 'site#landing', as: 'landing'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'signout', to: 'sessions#destroy', as: 'signout'

end
