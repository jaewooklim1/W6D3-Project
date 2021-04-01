class CommentsController < ApplicationController

    def index 
        if params.has_key?(:commenter_id) && !params.has_key?(:artwork_id)
            render json: User.joins(:comments)
                             .where(users: {id: params[:commenter_id]})
                             .select('comments.*')
        elsif params.has_key?(:artwork_id) && !params.has_key?(:commenter_id)
            render json: Artwork.joins(:comments)
                                .where(artworks: {id: params[:artwork_id]})
                                .select('comments.*')
        elsif params.has_key?(:artwork_id) && params.has_key?(:commenter_id)
            if params[:artwork_id].empty? && params[:commenter_id].empty? 
                render json: "Please specify user and/or artwork"
            else
                render json: User.joins(:artworks_comments)
                                .where(artworks: {id: params[:artwork_id]})
                                .where(comments: {commenter_id: params[:commenter_id]})
                                .select('comments.*')
            end
        else
            render json: "Please specify user and/or artwork"
        end        
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save 
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy 
        redirect_to comments_url 
    end

    private

    def comment_params
        params.require(:comment).permit(:commenter_id, :artwork_id, :body)
    end
end