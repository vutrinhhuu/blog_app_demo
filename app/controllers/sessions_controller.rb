class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
      flash[:danger] = t("already_login")
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = t("not_activated")
        message += t("check_email_for_link")
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = t("invalid_error")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
