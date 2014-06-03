Rails.application.routes.draw do
  root 'activities#index'

  get 'login',            to: 'account#login'
  get 'authorize',        to: 'account#authorize'

  resources :activities, only: [:index] do
    collection do
      get 'setup'
      put 'setup'
      post 'upload'
    end
  end

end
