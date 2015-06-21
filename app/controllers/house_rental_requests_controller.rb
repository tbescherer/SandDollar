class HouseRentalRequestsController < ApplicationController

  before_action :require_signed_in

  def create
    @request = HouseRentalRequest.new(rental_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to house_url(@request.house)
    else
      flash[:errors] = @request.errors.full_messages
      render :new
    end
  end

  def new
    @request = HouseRentalRequest.new
  end

  def edit
  end

  def update
  end

  private

  def rental_params
    params.require(:house_rental_request).permit(:house_id, :user_id, :start_date, :end_date, :status)
  end

end
