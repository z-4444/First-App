class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:article_id])
        # if current_user != @article.user
        @comment = @article.comments.create!(comment_params)
        
        # @rating=@article.comments.create!(params[:rating])
        # debugger
        @comment.save
        respond_to do |format|
            format.html { redirect_to article_path(@article), notice: 'Comment was successfully created.' }
            format.js   {}
            format.json { render json: @comment, status: :created, location: @comment }
        end
        
    end

    def destroy
        @article = Article.find(params[:article_id])

        @comment = @article.comments.find(params[:id])
        
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to article_path(@article), notice: 'Comment successfully removed.' }
            format.js   { render :layout => false }
            format.json {  head :no_content }
        end
        
        # redirect_to article_path(@article)
    end
     
    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :score)
    end
end