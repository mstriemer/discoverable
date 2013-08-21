Discoverable::Application.routes.draw do
  root to: 'api#index'
  resources :issues
end
