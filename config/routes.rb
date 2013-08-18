Colormaps::Application.routes.draw do
  root 'colormaps#index'
  resources :colormaps
  resources :lists, only: :index
end
