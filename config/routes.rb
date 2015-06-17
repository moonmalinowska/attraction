Rails.application.routes.draw do

  get 'error/not_found'

  devise_for :users


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'tag/show'

  root to: 'static_page#home'

  get 'static_page/home'

  get 'static_page/trips'

  get 'static_page/fairs'

  get 'static_page/museums'

  #get 'static_page/search'

  get 'static_page/tips'

  get 'static_page/search_model/:id' => 'static_page#search_model'

  resources :varieties

  resources :regions

  resources :categories

  resources :attractions

  resources :tag

  match "static_page/search(/:results)" => 'static_page#search', via: [:get, :post], as: 'static_page_search'
  post 'search', to: 'search#search'

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

  get "*any", via: :all, to: "error#not_found"
end
