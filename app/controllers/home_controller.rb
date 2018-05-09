class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def contact
  end

  def send_email
    UserMailer.send_email(params[:contact]).deliver_now
    redirect_to root_path
  end

  def blog
    @blogs = Blog.all
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
