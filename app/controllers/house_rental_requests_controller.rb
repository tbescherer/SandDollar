class HouseRentalRequestsController < ApplicationController

  before_action :require_signed_in

  def create
    @request = HouseRentalRequest.new(rental_params)
    @request.user_id = current_user.id
    @request.status = "Pending"
    if @request.save
      flash[:errors] = ["House request Submitted!"]
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
    @request = HouseRentalRequest.find(params[:id])
  end

  def update
    @request = HouseRentalRequest.find(params[:id])
    if @request.update(rental_params)
      flash[:errors] = ["submission accepted"]
      redirect_to user_url(current_user)
    else
      flash[:errors] = ["something went awry!"]
      render :edit
    end
  end

  private

  def rental_params
    params.require(:house_rental_request).permit(:house_id, :user_id, :start_date, :end_date, :status)
  end

end
