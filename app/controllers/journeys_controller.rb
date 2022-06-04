class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit destroy update]

  def index
    @journeys = current_user.journeys.where.not(journey_status: :started)
    @current_journeys = current_user.journeys.where(journey_status: :started)
  end

  def show
    @user = current_user
  # the `geocoded` scope filters only journey starting and destination with coordinates (latitude & longitude)
    @markers = [{
      lat: @journey.starting_point.latitude,
      lng: @journey.starting_point.longitude,
      image_url: helpers.asset_url("starting_point.png"),
      info_window: render_to_string(partial: "info_start_window", locals: { journey: @journey.starting_point })
  }]
  @markers << {
    lat: @journey.destination.latitude,
    lng: @journey.destination.longitude,
    image_url: helpers.asset_url("destination.png"),
    info_window: render_to_string(partial: "info_end_window", locals: { journey: @journey.destination })
  }
  end

  def new
    @user = current_user
    if Journey.exists?(user_id: @user.id, journey_status: "started")
      redirect_to journey_path(Journey.find_or_create_by(journey_status: "started")), alert: "You have an active Journey please end the current journey before starting a new one"
    else
      @user_safe_places = []
      @buddies = current_user.buddies
      @journey = Journey.new
      @user.safe_places.each do |s|
        @user_safe_places << [s.name, s.address.id]
      end
      return @user_safe_places
    end
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    if params[:journey][:starting_point_id].instance_of?(ActionController::Parameters)
      @journey.starting_point = Address.find_or_create_by(address_line1: params[:journey][:starting_point_id][:address_line1],address_line2: params[:journey][:starting_point_id][:address_line2], postcode: params[:journey][:starting_point_id][:postcode], city: params[:journey][:starting_point_id][:city])
    else
      @journey.starting_point = Address.find_or_create_by(id: params[:journey][:starting_point_id].to_i)
    end
    if params[:journey][:destination_id].instance_of?(ActionController::Parameters)
      @journey.destination = Address.find_or_create_by(address_line1: params[:journey][:destination_id][:address_line1], address_line2: params[:journey][:destination_id][:address_line2], postcode: params[:journey][:destination_id][:postcode], city: params[:journey][:destination_id][:city])
    else
      @journey.destination = Address.find_or_create_by(id: params[:journey][:destination_id].to_i)
    end
    @journey.save!
    if @journey.save!
      @journey.update(journey_status: :started)
      # TwilioClient.new.send_text('+4915784477390', start_message)
      redirect_to journey_path(@journey)
    else
      render :new, notice: "Your journey could not be started."
    end
  end

  def edit
    @user_safe_places = []
    @user = current_user
    @buddies = current_user.buddies
    @journey = Journey.new
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
    # TwilioClient.new.send_text('+4915784477390', finish_message)
    redirect_to root_path
  end

  private

  def set_journey
    @journey = Journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:mode_of_transportation, :time_estimate, :buddy_id, starting_point_id: [:id, :address_line1, :address_line2, :postcode, :city], destination_id: [:id, :address_line1, :address_line2, :postcode, :city])
  end

  def start_message
    @user = current_user
    "#{@user.name} has started a journey from #{@journey.starting_point.address_line1} to #{@journey.destination.address_line1} (#{@journey.time_estimate} min.)"
  end

  def finish_message
    @user = current_user
    "#{@user.name} is safe."
  end
end
