TyaniTolkay::Application.routes.draw do
  devise_for :users

  root :to => "searcher#main"

  match "main" => "searcher#main", :as => :main
  match "search" => "searcher#search", :as => :search

  match "user/list" => "user#list", :as => :user_list
  match "user/:id" => "user#view", :as => :view_user
  match "user/:id/to_admin" => "user#to_admin", :as => :user_to_admin
  match "user/:id/to_moderator" => "user#to_moderator", :as => :user_to_moderator
  match "user/:id/remove" => "user#remove", :as => :remove_user

  match "ad/save" => "ad#save", :as => :save_ad
  match "ad/new" => "ad#new", :as => :create_ad
  match "ad/:id" => "ad#view", :as => :view_ad
  match "ad/:id/remove" => "ad#remove", :as => :remove_ad
  match "ad/:id/edit" => "ad#edit", :as => :edit_ad

  match "message/create" => "message#create", :as => :create_message

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
