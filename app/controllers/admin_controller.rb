class AdminController < ApplicationController
    
    def index
        
    end

    def articles
       @article=Article.all.order('created_at DESC') 
    end

    def users
        @users=User.all.order('created_at DESC')
    end

end
