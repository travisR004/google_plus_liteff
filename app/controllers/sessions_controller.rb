class SessionsController < ApplicationController
  before_action :require_logged_out, only: :new
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to root_url
  end

  def require_logged_out
    redirect_to user_url(current_user) if logged_in?
  end

end
