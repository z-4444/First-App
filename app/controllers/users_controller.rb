class UsersController < ApplicationController
    # before_action :authenticate_user!
    # before_action :authenticate_admin!
    
    def index
        @users=User.all
    end

    def show
        @user=User.find(params[:id])
    end

    def change_status
        @user=User.find(params[:id])
        if @user.status== 'active'
            # debugger
            # @user.update!(status: 0)
            # @user.status = 0
            @user.update(status: 0)
            # @user.update.where(status: 0)
            redirect_to users_path        
        else
            @user.update(status: 1)
            redirect_to users_path    
        end
    end


end
