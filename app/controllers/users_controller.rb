class UsersController < ApplicationController

    before_action :require_login, only: [:show, :destroy]

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            login_in(user)
            redirect_to profile_path(user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        current_user.destroy
        redirect_to signup_path
    end

    private 
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
