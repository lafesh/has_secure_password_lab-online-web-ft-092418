class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.clear
        redirect_to new_user_path
    end
end
