class HousesController < ApplicationController

  before_action :require_signed_in

  def new
    @house = current_user.owned_houses.new
  end

  def create
    @house = current_user.owned_houses.new(house_params)
    if @house.save
      redirect_to house_url(@house)
    else
      flash[:errors] = @house.errors.full_messages
      render :new
    end
  end

  def show
    @house = House.find(params[:id])
    render :show
  end

  def index
    render :index
  end

  def edit
    @house = House.find(params[:id])
    if @house.update(house_params)
      redirect_to house_url(@house)
    else
      flash[:errors] = @house.errors.full_messages
      render :edit
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    flash[:errors] = ["House successfully deleted"]
    redirect_to houses_url
  end

  private

  def house_params
    params.require(:house).permit(:owner_id, :decription, :address)
  end

end
