class SafePlacesController < ApplicationController
  before_action :set_safe_place, only: %i[show edit destroy update]

  def index
    @safe_places = current_user.safe_places
  end

  def show
		# the `geocoded` scope filters only safe places with coordinates (latitude & longitude)
		@markers = [{
   		lat: @safe_place.address.latitude,
   		lng: @safe_place.address.longitude,
			image_url: helpers.asset_url("destination.png"),
			info_window: render_to_string(partial: "info_window", locals: { safep_place: @safe_place.address })
		}]
  end

  def new
    @safe_place = SafePlace.new
  end

  def create
    @safe_place = SafePlace.new(safe_place_params)
    @safe_place.user = current_user
    @safe_place.address = Address.last
    @safe_place.save!
    if @safe_place.save!
      if current_user.safe_places.count == 1
        redirect_to landing_path
      else
        redirect_to safe_places_path
      end
    else
      render :new, notice: "Please check your safe place's details."
    end
  end

  def edit
  end

  def update
    if @safe_place.update(safe_place_params)
      redirect_to safe_places_path, notice: "Your safe place was successfully updated!"
    else
      render :edit, notice: "Please check your safe place's details"
    end
  end

  def destroy
    @address = @safe_place.address
    @safe_place.destroy
    @address.destroy
    redirect_to safe_places_path
  end

  private

  def set_safe_place
    @safe_place = SafePlace.find(params[:id])
  end

  def safe_place_params
    params.require(:safe_place).permit(:name)
  end
end
