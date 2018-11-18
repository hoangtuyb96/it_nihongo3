class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env["omniauth.auth"].present?
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path
    else
    	user = User.find_by(login_name: params[:session][:login_name].downcase)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == "1" ? remember(user) : forget(user)
          redirect_to user
        else
          flash[:warning] = "Account not activated. Check your email for the activation link."
          redirect_to root_url
        end
      else
      	flash[:danger] = 'Invalid login name/password combination'
    		render 'new'
    	end
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
