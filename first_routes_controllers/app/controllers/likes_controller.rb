class LikesController < ApplicationController
    def index 
        if params.has_key?(:comment_id)
            comment_likes = Like.where(likeable_type: :Comment).where(likeable_id: params[:comment_id])
            render json: comment_likes
        elsif params.has_key?(:artwork_id)
            artwork_likes = Like.where(likeable_type: :Artwork).where(likeable_id: params[:artwork_id])
            render json: artwork_likes 
        else
            render json: "Comment or artwork not found"
        end
    end

    def create 
        like = Like.new(like_params)
        if like.save 
            render json: like 
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        like = Like.find(params[:id])
        like.destroy 
        render json: "Unliked"
    end

    def like_params
        params.require(:like).permit(:user_id, :likeable_type, :likeable_id)
    end
end