class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.create!(address_params)
    if @address.save
      redirect_to new_safe_place_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:address_line1, :address_line1, :postcode, :city)
  end
end
