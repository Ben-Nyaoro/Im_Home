class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home welcome safe_places_intro buddy_intro]

  def home
    if signed_in?
      redirect_to landing_path
    end
  end

  def profile
    if signed_in?
      @user = current_user
    end
  end

  def landing
    @buddies = current_user.buddies.last(4)
  end

end
