Rails.application.routes.draw do

  root to: 'site#landing', as: 'landing'

  # get 'selfies', to: 'selfies#index', as: 'selfies'
  post 'selfies', to: 'selfies#create'
  get 'selfies/new', to: 'selfies#new', as: 'new_selfie'

  # get 'api/v1/selfies/recent', to: 'selfies#recent'
  post 'api/v1/selfies/recent', to: 'selfies#recent', as: 'recent_selfie'

  get 'about', to: 'site#about', as: 'about'
  get 'feed', to: 'site#feed', as: 'feed'
  get 'profile', to: 'site#profile', as: 'profile'
  post 'profile', to: 'site#profile', as: 'profile_post'

  get 'terms', to: 'site#terms', as: 'terms'
  get 'phone', to: 'site#phone', as: 'phone'

  get 'signin', to: 'site#signin', as: 'signin'
  get 'signin-upload', to: 'site#signin_upload', as: 'signin_upload'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

end
