class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
              params[:session][:username],
              params[:session][:password]
              )
    log_in(@user)
    redirect_to rentals_url
  end

  def new
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
