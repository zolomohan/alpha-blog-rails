class SessionsController < ApplicationController
    def new
    
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user
            session[:user_id] = user.id
            flash[:success] = "Logged in Succesfully"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Something wrong with Login Info"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged out Successfully"
        redirect_to articles_path
    end
end