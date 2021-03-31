class ArtworksController < ApplicationController

    def index
        artworks = Artwork.all
        render json: artworks
    end

    def create

        artwork = Artwork.new(params.require(:artworks).permit(artwork_params))
        # replace the `user_attributes_here` with the actual attribute keys
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end   

    end

    def show
        artworks = Artwork.find(params[:id])
        render json: artworks
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
           redirect_to artwork_url(artwork)
        else
           render json: artworks.errors.full_messages, status: :unprocessable_entity # rails method, same as 422
        end
    end

    
    def destroy
        artworks = Artwork.find(params[:id])        
        artworks.destroy
        redirect_to artworks_url
    end

    private

    def artwork_params
        # debugger
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end