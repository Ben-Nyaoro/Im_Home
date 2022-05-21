class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if signed_in?
			@buddies = current_user.buddies.first(4)
		end
  end

  def profile
    if signed_in?
			@user = current_user
		end
  end
end
