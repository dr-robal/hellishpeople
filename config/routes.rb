PiekielniPl::Application.routes.draw do
  get "comments/new"

  match 'rules' => 'pages#rules', :as => :rules

  get "users/profile"
  match 'profile/:id(/:page)' => 'users#profile', :as => :profile
  #match 'edit/:id' => 'users#edit', :as => :edit_user
    
  get "users/userslist"
  match 'users/userslist(/:page)' => 'users#userslist', :as => :userslist

  
  match 'tales/tothemain/:id' => 'tales#tothemain', :as => :tothemain
  match 'tales/totheawaiting/:id' => 'tales#totheawaiting', :as => :totheawaiting
  
  
  match 'awaiting(/:page)' => 'tales#awaiting', :as => :awaiting
  resources :tales do
	    resources :comments
  end
  match 'tales/index(/:page)' => 'tales#index'#, :as => :index  
  
  resources :comments do
	    resources :comments
  end
  
  devise_for :users, :controllers => { :registrations => 'registrations' }

  devise_scope :user do
    get "register"  => "devise/registrations#new" 
    get "login"  => "devise/sessions#new"    
    get "logout" => "devise/sessions#destroy"
    get "edit_account" => "devise/registrations#edit"
  end
  
  resources :users, :controller => "users"
  
  #root :to => 'pages#home'
  root :to => 'tales#index'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
