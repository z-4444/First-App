Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  class ActiveAdmin::Devise::SessionsController 
 
    def after_sign_in_path_for(resource)
     case resource
      when AdminUser then '/admin'
       else super
     end
    end
    
    def after_sign_out_path_for(resource)
     '/admin/login'
    end
   end


  mount Ckeditor::Engine => '/ckeditor'
  # mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations" 
  }

  get 'home/index'
  # get 'admin/index'
  
  root 'home#index'
   
  # get 'users/change_status' ,to: 'users#change_status'

  resources :users, only: [:index,:show] do
    member do
      get :change_status
    end
  end  

  resources :articles do
     member do
      get :change_status
     end
     resources :comments
  end
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html    # get 'users/index'
end
