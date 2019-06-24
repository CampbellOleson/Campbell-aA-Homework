class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show   
        @user = User.find(params[:id])
    end

    def new
        @user = User.new 
    end

    def update
        @user = User.find(params[:id])
        render :edit
    end

    def create
        
    end
 
    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
