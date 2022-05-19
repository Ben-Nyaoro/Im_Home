class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if signed_in?
			@buddies = current_user.buddies
		end
  end
end
