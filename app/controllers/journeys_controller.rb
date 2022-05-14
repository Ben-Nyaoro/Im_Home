class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :destoy, :update]

  def index
    @user = current_user
    @journeys = Journey.all
    @user_journeys = []
    @journeys.each do |journey|
      @user_journeys << journey if journey.user == current_user
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
  end

  private

  def set_journey
    @journey = Journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:starting_point, :destination, :mode_of_transportation, :time_estimate)
  end
end
