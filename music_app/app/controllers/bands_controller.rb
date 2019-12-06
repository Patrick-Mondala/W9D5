class BandsController < ApplicationController

    before_action :require_login

    def index
        render :index
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_error_messages
            render :new
        end
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def edit
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        
        if @band.update!(band_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_error_messages
        end
    end

    def destroy
        @band = Band.find(params[:id])
        
        if @band.destroy
            redirect_to bands_url
        else
            flash.now[:errors] = @band.errors.full_error_messages
        end
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end