class AddressesController < ApplicationController
  before_action :set_address, only: %i[edit update delete]

  def new
    @address = Address.new
  end

  def create
    @user = current_user
    @address = Address.new(address_params)
    if @address.postcode.nil?
      address_array = @address.address_line1.split(',')
      address_sub_array = address_array[1].split
      @address.address_line1 = address_array[0]
      @address.postcode = address_sub_array[0].to_i
      @address.city = address_sub_array[1]
    end
      @address.save!
    if @address.save
      redirect_to new_safe_place_path
    end
  end

  def edit
  end

  def update
    if @address.postcode.nil?
      address_array = @address.address_line1.split(',')
      address_sub_array = address_array[1].split
      @address.address_line1 = address_array[0]
      @address.postcode = address_sub_array[0].to_i
      @address.city = address_sub_array[1]
    end
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
    # @address_id = @safe_place.address_id
    # @address = Address.find_or_create_by(id: @address_id)
  end
end
