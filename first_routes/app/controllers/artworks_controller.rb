
class ArtworksController < ApplicationController

    def index   
        @user = User.find(params[:user_id])
        @artworks = @user.shared_artworks
        @artworks += @user.artworks
        render json: @artworks
    end

   

    def create
        artwork =  Artwork.new(artwork_params)
        
        if artwork.save
            redirect_to artwork_url(artwork.id)
        else  
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @artwork = Artwork.find(params[:id])
        @artwork.destroy 
        redirect_to artworks_url
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end
end