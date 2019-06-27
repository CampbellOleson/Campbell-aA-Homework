class SubsController < ApplicationController
    before_action :require_logged_in!, only: [:new, :create, :edit, :update]

    def index
        @subs = Sub.all
    end

    def show
        @sub = Sub.find(params[:id])
    end

    def new
        @sub = Sub.new
    end

    def create
        @sub = current_user.subs.new(subs_params)
        if @sub.save
            flash[:success] = "Successfully created sub"
            redirect_to subs_url
        else
            flash[:errors] = "Failed to create sub"
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        if current_user.id == @sub.moderator.id
            render :edit
        end
    end

    def update
        @sub = Sub.find(params[:id])
        if current_user.id == @sub.moderator.id
            if @sub.update(subs_params)
                flash[:success] = "good edits"
                redirect_to subs_url
            else
                flash.now[:errors] = "messed up"
                render :edit
            end
        end
    end

    private

    def subs_params
        params.require(:sub).permit(:title, :description)
    end
end
