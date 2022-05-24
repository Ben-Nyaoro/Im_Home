class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit destroy update]

  def index
    @journeys = current_user.journeys
  end

  def show
    @user_safe_places = current_user.safe_places
  end

  def new
    @user_safe_places = []
    @user = current_user
    @buddies = current_user.buddies
    @journey = Journey.new
    @user.safe_places.each do |s|
      @user_safe_places << [s.name, s.address]
    end
    return @user_safe_places
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
		@journey.starting_point = Address.find_or_create_by(journey_params[:starting_point_id])
    @journey.destination = Address.find_or_create_by(journey_params_destination[:destination_id])
    @journey.save!
    if @journey.save!
      @journey.update(journey_status: :started)
      redirect_to journey_path(@journey)
    else
      render :new, notice: "Your journey could not be started."
    end
  end

  def edit
  end

  def update
    if @journey.update(journey_params)
      redirect_to @journey, notice: "Your journey was successfully updated. Take care!"
    else
      render :edit, notice: "Please check your journey's details"
    end
  end

  def destroy
    @journey.update(journey_status: :completed)
    redirect_to root_path
  end

  private

  def set_journey
    @journey = Journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:destination_id, :mode_of_transportation, :time_estimate, :buddy_id, starting_point_id: [:address_line1, :address_line2, :postcode, :city])
  end

  def journey_params_destination
    params.require(:journey).permit(destination_id: [:address_line1, :address_line2, :postcode, :city])
  end
end
