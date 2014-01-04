Thedoty::Application.routes.draw do
  # Home page is the blog
  get '/' => "blog#index"

  # Photos
  resources :photos, defaults: { format: :html }
  # Hack to use will_paginate with an AngularJS view
  get '/photos/page/:page.json' => "photos#page", defaults: { format: :json }

  # Favorites
  resources :favorites, defaults: { format: :html }

  # About
  get '/about' => "about#index"
  get '/about/index.partial' => "about#about"

  # RSS Feed
  get '/rss.xml' => "blog#feed", defaults: { format: :xml }
  get '/feed.xml' => "blog#feed", defaults: { format: :xml }
  get '/feed.rss' => "blog#feed", defaults: { format: :xml }
  get '/feed' => "blog#feed", defaults: { format: :xml }

  # Authentication
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  get '/sessions/not_admin' => 'sessions#not_admin'
  delete '/sessions/destroy' => 'sessions#destroy'

  # Admin site
  get '/admin' => 'admin#index'

  # AngularJS partials routed through application#partial
  get '/:controller/partial/:partial.html', action: :partial

  # The default for friendly blog post IDs.
  get '/:id' => "blog#show"
end
