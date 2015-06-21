class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
              params[:session][:username],
              params[:session][:password]
              )
    sign_in(@user)
    redirect_to houses_url
  end

  def new
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
