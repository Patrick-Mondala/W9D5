class AlbumsController < ApplicationController
    before_action :require_login

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_error_messages
            render :new
        end
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def edit
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        
        if @album.update!(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_error_messages
        end
    end

    def destroy
        @album = Album.find(params[:id])
        
        if @album.destroy
            redirect_to albums_url
        else
            flash.now[:errors] = @album.errors.full_error_messages
            render :show
        end
    end

    private

    def album_params
        params.require(:band).permit(:title, :year, :live, :band_id)
    end
end
