class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def edit
        
    end

    def update
        if @user.update(user_params)
            flash[:success] = "User Info Update Successfully"
            redirect_to articles_path
        else
            render :edit
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Alpha Blog #{@user.username}"
            redirect_to articles_path
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end