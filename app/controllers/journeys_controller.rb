class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit destoy update]

  def index
    @user = current_user
    @journeys = Journey.all
    @user_journeys = []
    @journeys.each do |journey|
      @user_journeys << journey if journey.user == current_user && journey.journey_status == "completed"
    end
    return @user_journeys
  end

  def show
  end

  def new
    @journey = Journey.new
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
      redirect to @journey, notice: "Your journey was successfully updated. Take care!"
    else
      render :edit, notice: "Please check your details"
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
    params.require(:journey).permit(:starting_point, :destination, :mode_of_transportation, :time_estimate, :buddy)
  end
end
