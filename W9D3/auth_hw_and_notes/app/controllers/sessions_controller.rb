class SessionsController

#    before_action: :thing, only: action(s)

    def create
        user = User.find_by_credentials(
            params[:email],
            params[:password]
        )

        if user
            session[:session_token] = user.reset_session_token!
            flash[:success] = "Success!"
            redirect_to fancy_url # fake
        else 
            flash[:error] = "invalid creds"
            render :new, status: 401
        end
    end

    def destroy
        current_user.reset_session_token!
        sessions[:session_token] = nil
        flash[:success] = "Successfully logged out"
        redirect_to login_page_url # fake
    end

end