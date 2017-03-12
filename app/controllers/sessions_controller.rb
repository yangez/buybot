class SessionsController < ApplicationController
  before_action :check_not_already_logged_in, only: %i(new create)

  def new
  end

  def create
    interactor = Users::FindOrCreateFromSlack.call(auth_hash)
    login_user interactor.user if interactor.success?
    redirect_to root_url, flash: { success: "Successfully logged in." }
  end

  def destroy
    logout_user
    redirect_to root_url
  end

  protected

  def auth_hash
    { auth_hash: request.env['omniauth.auth'] }
  end

  def check_not_already_logged_in
    # return redirect_to dashboard_url, flash: { error: "You are already logged in." } if current_user.present?
  end

end
