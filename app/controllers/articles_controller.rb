class ArticlesController < ApplicationController
    before_action :authenticate_user! , except:[:index,:show]
    # before_action :authenticate_user! , only: [:edit,:update,:destroy]

    def index
        # respond_to do |format|
        #     format.html
        #     format.json { render json: ArticleDatatable.new(article_params) }
        #   end
        @articles = Article.all
    end
    def show
        @article=Article.find(params[:id])
    end

    def new
        @article =Article.new
    end
    def edit
        @article=Article.find(params[:id]) 
        # redirect_to @article
        # unless @article.user==current_user end
    end

       
    def create
        @article = current_user.articles.new(article_params)
        # @article.user=current_user
        # @user = User.find(params[:user_id])
        # @article.gotten_id = @user.id
        # respond_to do |format|
            if @article.save
                ArticleMailer.post_created(@article).deliver_later
                # format.html { redirect_to @article, notice: 'Article was successfully created.' }
                # format.js   {}
                # format.json { render json: @article, status: :created, location: @article }
                redirect_to @article
            else
                # format.html { render action: "new" }
                # format.json { render json: @article.errors, status: :unprocessable_entity }
                render 'new'
            end
        

    end

    def change_status
        @article=Article.find(params[:id])
        if @article.status== 'pending'
            # debugger
            # @user.update!(status: 0)
            # @user.status = 0
            @article.update(status: 1)
            # @user.update.where(status: 0)
            redirect_to articles_path
        else
            @article.update(status: 0)
            redirect_to articles_path 
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
       
    end
    def destroy
        @article=Article.find(params[:id])
            @article.destroy
            redirect_to articles_path 
        
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text, :image,:comment_counter)
    end

 
    

end
