RailsBootstrap::Application.routes.draw do
  get 'workers' => 'workers#index', as: :workers

  get 'ucls' => 'ucls#index', as: :ucls
  root :to => 'visitors#new'

  resources :instruments, only: [:new, :create, :show, :edit, :destroy, :update]
  resources :observation_sections, only: [:edit, :update]
  resources :evaluation_events, only: [:new]
end
