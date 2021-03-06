Rails.application.routes.draw do
  root 'sessions#home'

  get 'load_planning' => 'loads#index'
  get 'orders_delivery' => 'orders_delivery#index'
  get 'get_delivery_data' => 'orders_delivery#get_delivery_data'
  get 'download_routing_list' => 'orders_delivery#download_routing_list'

  resources :order_releases

  post 'save_orders' => 'order_releases#save_orders'

  get 'get_available_orders' => 'loads#get_available_orders'
  get 'get_load_data' => 'loads#get_load_data'
  post 'submit_orders' => 'loads#submit_orders'
  post 'return_orders' => 'loads#return_orders'
  post 'reorder_planning_orders' => 'loads#reorder_planning_orders'
  post 'complete_load' => 'loads#complete_load'
  post 'split_order' => 'loads#split_order'
  post 'update_load_data' => 'loads#update_load_data'
  post 'reopen_load' => 'loads#reopen_load'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'

  match "*path", :to => "application#catch_routing_error", :via => :all

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
