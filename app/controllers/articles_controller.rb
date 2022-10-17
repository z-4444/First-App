class ArticlesController < ApplicationController
    before_action :authenticate_user! , except:[:index]

    def index
        @articles = Article.all
    end
    def show
        @article=Article.find(params[:id])
        @comments = @article.comments.order("created_at DESC")
    end

    def new
        @article =Article.new
    end
    def edit
        @article=Article.find(params[:id])
    end

       
    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            ArticleMailer.post_created(@article).deliver_later
            redirect_to @article
        else
            render 'new'
        end
    end

    def change_status
        @article=Article.find(params[:id])
        if @article.status== 'pending'
            @article.update(status: 1)
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
