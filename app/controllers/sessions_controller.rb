class SessionsController < ApplicationController
 
  def create
    user = User.find_by(email: params[:session][:email])
    admin = Admin.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_url, notice: 'Logged in successfully as a user.'
    elsif admin && admin.authenticate(params[:session][:password])
      log_in(admin)
      redirect_to root_url, notice: 'Logged in successfully as an admin.'
    else
      flash.now[:alert] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: 'Logged out successfully.'
  end

  private

  def log_in(user)
    session[:user_id] = user.id
    session[:admin_id] = nil
  end

  def log_in(admin)
    session[:admin_id] = admin.id
    session[:user_id] = nil
  end

  def log_out
    session.delete(:user_id)
    session.delete(:admin_id)
  end

  def logged_in_user
    User.find_by(id: session[:user_id])
  end

  def logged_in_admin
    Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    logged_in_user.present? || logged_in_admin.present?
  end
end