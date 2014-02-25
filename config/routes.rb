SocialThingamjig::Application.routes.draw do
  root to: 'sessions#new'
  resources :users do
    get 'feed'
  end
  resource :session
  resource :reset
  resources :friend_circles
  resources :posts do
    post 'upvote'
  end
end
