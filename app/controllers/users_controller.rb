class UsersController < ApplicationController
    before_action :get_user, only: [:show, :edit, :update, :destroy]


    def show

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user(@user)
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    
    private
    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end


end
