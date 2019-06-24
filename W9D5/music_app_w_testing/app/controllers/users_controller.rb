class UsersController < ApplicationController
    # helper_method :user_params

    def index
        @users = User.all
        render :index
    end

    def show
        @user = current_user
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def edit
        @user = current_user
        render :edit 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = 'User succesfully created!'
            render :show
        else
            flash[:error] = 'Failed to create user:'
            render :new
        end
    end

    def update 
        if current_user.update(user_params)
            flash[:success] = 'User succesfully updated!'
        else
            flash[:error] = 'User failed to update.'
            redirect_to edit_user
        end
    end

    private

    def user_params
        params.require(:user).permit(:email,:password)
    end
end