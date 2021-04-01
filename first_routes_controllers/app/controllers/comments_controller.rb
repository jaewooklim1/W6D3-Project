class CommentsController < ApplicationController

    def index 
        
        # debugger
        if comment_params.has_key?(:user_id) && !comment_params.has_key?(:artwork_id)
            render json: User.joins(:comments).where(users: {id: params[:comment][:user_id]})     
        elsif comment_params.has_key?(:artwork_id) && !comment_params.has_key?(:user_id)
            render json: Artwork.joins(:comments).where(artwork: {id: params[:comment][:artwork_id]})
        elsif comment_params.has_key?(:artwork_id) && comment_params.has_key?(:user_id)
            render json: User.joins(:artworks_comments).where(artworks: {id: params[:comment][:artwork_id]})
        else
            render json: "Please specify user or artwork" 
        end        
    end

    def create

    end

    def destroy

    end



    private

    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id)
    end
end