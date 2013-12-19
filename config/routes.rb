Thedoty::Application.routes.draw do
  get '/' => "blog#index"
  resources :photos, defaults: { format: :html }
  get '/photos/page/:page.json' => "photos#page", defaults: { format: :json }
  resources :favorites, defaults: { format: :html }
  get '/about' => "about#index"
  get '/rss.xml' => "blog#feed", defaults: { format: :xml }
  get '/feed.xml' => "blog#feed", defaults: { format: :xml }
  get '/feed.rss' => "blog#feed", defaults: { format: :xml }
  get '/feed' => "blog#feed", defaults: { format: :xml }
  get '/:id' => "blog#show"
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  get '/sessions/not_admin' => 'sessions#not_admin'
  get '/sessions/destroy' => 'sessions#destroy' # TODO: Not restful

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
