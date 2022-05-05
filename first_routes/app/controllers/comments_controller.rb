class CommentsController < ApplicationController

    def index 
        
        if params.has_key?(:artwork_id)
            @artwork = Artwork.find(params[:artwork_id])
            @comments = @artwork.comments
            render json: @comments
        else
            @user = User.find(params[:user_id])
            @comments = @user.comments
            render json: @comments
        end
        
    end


    def create
        comment = Comment.new(comment_params)
        
        if comment.save
            redirect_to comment_url(comment.id)
        else  
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        @comment = Comment.find(params[:id])
        render json: @comment
    end

    # # def update
    # #     @comment = Comment.find(params[:id])
    # #     if @comment.update(comment_params)
    # #         redirect_to comment_url(@comment)
    # #     else
    # #         render json: @comment.errors.full_messages, status: :unprocessable_entity
    # #     end
    # # end

    def destroy 
        @comment = Comment.find(params[:id])
        @comment.destroy 
        redirect_to comments_url
    end

    private
    def comment_params
        params.require(:comment).permit(:artwork_id, :user_id, :body)
    end
    
end