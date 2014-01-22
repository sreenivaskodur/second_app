class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:user][:password])
            sign_in user
            redirect_to user
        else
            flash[:error].now = "Invalid email/password combination"
            render 'new'
        end
    end

    def destroy
    end
end