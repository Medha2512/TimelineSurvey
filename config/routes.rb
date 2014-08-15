Rails.application.routes.draw do

  get 'password_resets/new'

  get 'educationtransitions/new'
  get 'careertransitions/new'
  root :to => "sessions#login"
  match "signup", :to => "users#new", via: :get
  resources :password_resets

  match "login", :to => "sessions#login", via: :get
  match "logout", :to => "sessions#logout", via: :get
  match "delete", :to => "users#delete", via: :get
  match "consent", :to => "sessions#consent", via: :get
  match "profile", :to => "sessions#profile", via: :get
  match "profile", :to => "sessions#profile", via: :post
  match "login_attempt", :to => "sessions#login_attempt", via: :post
  match "consent_decision", :to => "sessions#consent_decision", via: :post
  match "timeline", :to => "sessions#timeline", via: :get
  match "timeline", :to => "sessions#timeline", via: :post
    match "trigger_startdate", :to => "sessions#trigger_startdate", via: :post

  match "create", :to => "users#create", via: :post
  match "careercreate", :to => "careertransitions#create", via: :post
  match "educationcreate", :to => "educationtransitions#create", via: :post
  match "likert", :to => "sessions#likertItems", via: :post
  match "likert", :to => "sessions#likertItems", via: :get
  match "likert_response", :to => "sessions#likert_response", via: :post
  match "sessions_controller/destroyItem", :to => "sessions#destroyItem", via: :post
  match "sessions_controller/update", :to => "sessions#update", via: :post
  match "ed_experience", :to => "sessions#ed_experience", via: :get
  match "ed_exp_response", :to => "sessions#ed_exp_response", via: :post
  match "thank_you", :to => "sessions#thank_you", via: :get
  match "admin_page", :to => "sessions#admin_page", via: :get
  match "download_xls", :to => "users#download_xls", via: :get
  match "demographics", :to => "sessions#demographics", via: :get
  match "demographic_response", :to => "sessions#demographic_response", via: :post
  match "sign_in_guest", :to => "sessions#sign_in_guest", via: :get

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
