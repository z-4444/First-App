ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password,
  #  :reset_password_token, :reset_password_sent_at, :remember_created_at,
  #   :name, :phone_number, :status, :role, :profile_pic
  # #
  # or
  #
  permit_params do
    permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
    :remember_created_at, :name, :phone_number, :status, :role, :profile_pic]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end


  show do
    attributes_table do
      row :email
      row :name
      row :status
      row :phone_number
      row :profile_pic do |profile|
        if profile.profile_pic.present?
         image_tag profile.profile_pic.url(:small)
        end
      end
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :id
    column :email
    column :name
    column "Current status" do |user|
      user.status
    end
    column :phone_number
    column :profile_pic do |profile| 
      if profile.profile_pic.present?
       image_tag profile.profile_pic.url(:thumb)
      end
     end
    column :created_at
    actions dropdown: true
    column "Change status" do |user|
      if user.pending?
        link_to 'Active' , active_admin_user_path(user), method: :put
      end
    end
  end


  scope :active
  scope :pending


  member_action :active, method: :put do
    resource.active!
    @user=User.find(params[:id])
    # debugger
    UserMailer.user_activated(@user).deliver_later
    redirect_to admin_users_path
  end

  action_item :active ,only: :show, if: proc {!resource.active?}  do
    # debugger
     link_to 'Active',[:active, :admin, resource] , method: :put 
  end

  member_action :pending, method: :put do
    resource.pending!
    redirect_to resource_path
  end

  action_item :pending ,only: :show, if: proc {!resource.pending?}  do
     link_to 'Pending',[:pending, :admin, resource] , method: :put 
  end

  

  
end
