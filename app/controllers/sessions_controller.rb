class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
              params[:session][:username],
              params[:session][:password]
              )
    if @user
      sign_in(@user)
      redirect_to houses_url
    else
      flash[:errors] = ["Invalid name or password"]
      render :new
    end
  end

  def new
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
