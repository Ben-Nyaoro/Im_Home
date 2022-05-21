class AddressesController < ApplicationController
  before_action :set_address, only: %i[edit update]

  def new
    @address = Address.new
  end

  def create
    @user = current_user
    @address = Address.create!(address_params)

    if @address.save
      redirect_to new_safe_place_path
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to safe_places_path, notice: "Your safe place was successfully updated."
    else
      render :edit, notice: "Please check your safe place's details"
    end
  end

  private

  def address_params
    params.require(:address).permit(:address_line1, :address_line2, :postcode, :city)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
