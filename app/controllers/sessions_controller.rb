class SessionsController < ApplicationController
  before_action :check_not_already_logged_in, only: %i(new create)

  def new
  end

  def create
    login_user User.find_or_create_by(email: auth_hash.info.email) if auth_hash.present?
    redirect_to root_url
  end

  def destroy
    logout_user
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def check_not_already_logged_in
    # return redirect_to dashboard_url, flash: { error: "You are already logged in." } if current_user.present?
  end

end
