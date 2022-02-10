Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: [:new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
    member do
      get 'search'
    end
  end
  resources :bookmarks, only: [:destroy]
end
