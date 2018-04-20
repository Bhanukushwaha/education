class HomeController < ApplicationController
  def index
  end
  def create
    user = Authentication.from_omniauth(request.env["omniauth.auth"])
    if user
      flash[:notice] = "Authentication successful."
     sign_in :user, user
     redirect_to root_path
    else
        flash[:notice] = "Authentication Failed."
        redirect_to "/users/sign_up"
    end
  end
  def failure
  end
end
