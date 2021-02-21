Rails.application.routes.draw do
  resources :links
  root to: "links#index"
end
