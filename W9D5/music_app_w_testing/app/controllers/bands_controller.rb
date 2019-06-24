class BandsController < ApplicationController

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def index
        @bands = Band.all
        render :index
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
        @band = Band.find(params[:id])
        render :edit 
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            flash[:success] = 'Band saved!'
            render :show
        else
            flash[:error] = 'Failed to save band.'
            render :new
        end
    end

    def update 
        @band = Band.find(params[:id])
        if @band.update(band_params)
            flash[:success] = 'Band succesfully updated!'
        else
            flash[:error] = 'Band failed to update.'
            redirect_to edit_band
        end
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end

end