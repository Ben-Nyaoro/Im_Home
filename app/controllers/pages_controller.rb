class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
		@buddies = current_user.buddies
  end
end
