class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user
            log_in_user!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = ["invalid login"]
            render :new
        end
    end

    def destroy
        user = current_user

        log_out_user!(user)
        redirect_to new_session_url
    end
end