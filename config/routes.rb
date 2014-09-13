Rails.application.routes.draw do

  root to: 'site#landing', as: 'landing'

  get 'selfies', to: 'selfies#index', as: 'selfies'
  post 'selfies', to: 'selfies#create'
  get 'selfies/new', to: 'selfies#new', as: 'new_selfie'

  get 'signin', to: 'site#signin', as: 'signin'
  get 'signin_upload', to: 'site#signin_upload', as: 'signin_upload'
  get 'profile', to: 'site#profile', as: 'profile'
  get 'terms', to: 'site#terms', as: 'terms'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'signout', to: 'sessions#destroy', as: 'signout'

end
