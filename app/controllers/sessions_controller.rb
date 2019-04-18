class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:next_path] ? cookies[:next_path] : tests_path
      cookies[:next_path] = nil
    else
      flash.now[:alert] = 'Something went wrong! Check ur email and password and try again!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
