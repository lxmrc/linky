Rails.application.routes.draw do
  devise_for :users
  patch '/links/:link_id/upvote', to: 'votes#upvote', as: :upvote
  patch '/links/:link_id/downvote', to: 'votes#downvote', as: :downvote

  resources :links

  root to: "links#index"
end
