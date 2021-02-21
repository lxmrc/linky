Rails.application.routes.draw do
  patch '/links/:id/upvote', to: 'links#upvote', as: :upvote
  patch '/links/:id/downvote', to: 'links#downvote', as: :downvote

  resources :links

  root to: "links#index"
end
