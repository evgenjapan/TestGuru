Rails.application.routes.draw do

  get 'gists/index'
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}

  get 'users/new'

  resources :feedbacks, only: :create
  get 'feedback', to: "feedbacks#new", as: "send_feedback"

  resources :user_badges, only: :index
  get 'user_badges', to: 'user_badges#index'

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
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end

    resources :gists, only: :index
    resources :badges
  end
end
