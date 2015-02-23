Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  get 'home/tarifs'
  get 'home/cgv'
  get 'home/contact'
  get 'home/faq'
  get 'home/siteweb'
  get 'contact/new_email'
  post 'contact/send_email'
  get 'contact/new_birthday_email'
  post 'contact/save_birthday_template'
  get 'contact/new_sms'
  post 'contact/send_sms'
  post 'contact/save_template'
  post 'contact/edit_template'
  post 'contact/delete_template'
  post 'contact/upload_img'
  get 'contact/preview_number_send_sms'
  get 'dashboard' => "dashboard#show"

  resources :payement do
    get "buy_one_year", :on => :collection
    post "pay_sms", :on => :collection
    post "ipn_notification_year", :on => :collection
    post "ipn_notification_credits", :on => :collection
    get "registration_successfully", :on => :collection
    get "credits_successfully", :on => :collection
    get "canceled", :on => :collection

    get "pay_monthly", :on => :collection
    get "paypal_recurring_success", :on => :collection
    post "ipn_notification_recurring", :on => :collection
  end


  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :contact

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

  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

end
