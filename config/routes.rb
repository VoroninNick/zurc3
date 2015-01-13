Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'


  Vs::DynamicRouter.load

  if AdminUser.table_exists?
    scope ActiveAdmin.application.default_namespace.to_s do
      match '(*a)', to: 'application#redirect_to_admin', via: [:get]
    end

    scope "/:locale", locale: /[A-Za-z]{2}/, defaults: { locale: I18n.locale } do
      devise_for :admin_users, ActiveAdmin::Devise.config
      ActiveAdmin.routes(self)


    end
  end

  #devise_for :admin_users, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  # get 'contact', to: 'contact#index', as: :contact
  #
  # get "news/list", to: 'news#list', as: :news_list
  # get "news/:id", to: 'news#view', as: :news_view
  # get "publications", to: 'publication#list', as: 'publication_list'
  # get "publications/:id", to: 'publication#view', as: :publication_view
  # #get "contact", to:'contact', as: 'contact'
  # get "about", to: 'page#about', as: 'about'
  # get "what-we-do", to: 'page#what_we_do', as: 'what_we_do'
  #get "*custom_page", to: 'page#custom_page'
  root to: "home#index"



  # mount Ckeditor::Engine => '/ckeditor'
  # devise_for :users
  # mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
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
