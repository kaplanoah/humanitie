Rails.application.routes.draw do

  get 'site/landing'

  root to: 'site#landing'

end
