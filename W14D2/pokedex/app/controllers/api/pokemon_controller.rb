class Api::PokemonController < ApplicationController
    def index
        @pokemon = Pokemon.all
    end

    def show
        @poke = Pokemon.find(params[:id])
    end

    def create
        @poke = Pokemon.new(poke_params)
        if @poke.save
            render :show 
        else
            flash.now[:errors] = @poke.errors.full_messages
        end
    end

    private

    def poke_params
        params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :image_url, :moves => [])
    end
end
