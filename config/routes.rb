Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: [:new, :show, :create] do
    resources :movies, only: [:create]
    member do
      get 'results', to: "movies#results"
      get 'search', to: "movies#search"
    end
  end
  resources :movies, only: [:destroy]
end
