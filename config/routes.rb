Allworld::Application.routes.draw do
  post 'ajax/showhide'

  mount Ckeditor::Engine => '/ckeditor'
  get "persons/profile"
  get 'persons/profile', as: 'user_root'
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get '/place/:tag', to: 'home#place'
  get '/country/:tag', to: 'home#country'
  get '/allnews', to: 'home#allnews'
  get '/news/:tag', to: 'home#news'
  get '/countries/:tag', to: 'home#countries'
  get '/section/:tag', to: 'home#section'
  get '/categories/:tag', to: 'home#categories'
  get '/allbest', to: 'home#allbest'
  get '/allwonders', to: 'home#allwonders'
  get '/allcountries', to: 'home#allcountries'
  get '/goroda', to: 'home#goroda'
  get '/search', to: 'application#search'

  get '/seen/:id', to: 'home#seen'
  get '/multyseen/:id/:country', to: 'home#multyseen'
  post '/multiseen/:id', to: 'placevidels#multiseen', as: :placevidels_multiseen
  get '/seenjs/:id', to: 'ajax#seenjs'
  get '/wishjs/:id', to: 'ajax#wishjs'
  get '/w', to: 'ajax#setsize'
  get '/wish/:id', to: 'home#wish'
  post '/multiwish/:id', to: 'placevidels#multiwish', as: :placevidels_multiwish
  get '/no/:id', to: 'home#no'

  get '/noseen/:id', to: 'home#noseen'
  get '/nowish/:id', to: 'home#nowish'
  get '/nono/:id', to: 'home#nono'


  get '/clickandgo/:id', to: 'home#clickandgo'

  get '/articles/:tag', to: 'home#submenu'
  get '/article/:tag', to: 'home#page'

  get "guide", to: 'home#index', :as =>'guide'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => 'home#glavnaya'
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
