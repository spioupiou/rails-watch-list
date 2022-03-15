Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: [:new, :show, :create] do
    resources :bookmarks, only: [:new, :create]
    resources :movies, only: [:new, :create]
    member do
      get 'results', to: "movies#results"
    end
  end
  resources :bookmarks, only: [:destroy]
end
