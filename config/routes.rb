Rails.application.routes.draw do

  get 'gists/index'
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}

  get 'users/new'

  root 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do

      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end

    resources :gists, only: :index
  end
end
