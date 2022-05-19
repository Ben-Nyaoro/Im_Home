class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit destroy update]

  def index
    @journeys = current_user.journeys
  end

  def show
    @user_safe_places = current_user.safe_places
  end

  def new
    @journey = Journey.new
    @user = current_user
    @buddies = current_user.buddies
    @user_safe_places = []
    @user.safe_places.each do |s|
      @user_safe_places << [s.name, s.address_id]
    end
    return @user_safe_places
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    @journey.save!
    if @journey.save!
      @journey.journey_status = "started"
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
    @journey.journey_status = "completed"
  end

  private

  def set_journey
    @journey = Journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:starting_point, :destination, :mode_of_transportation, :time_estimate, :buddy_id)
  end
end
