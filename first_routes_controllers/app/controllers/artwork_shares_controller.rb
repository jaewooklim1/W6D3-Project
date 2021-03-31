class ArtworkSharesController < ApplicationController

    def create

        artwork_share = User.new(params.require(:artwork_shares).permit(artwork_share_params))
        # replace the `user_attributes_here` with the actual attribute keys
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end   

    end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])        
        artwork_share.destroy
        redirect_to artwork_share_url
    end

    private

    def artwork_share_params
        # debugger
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end