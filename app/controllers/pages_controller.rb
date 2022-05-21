class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if signed_in?
<<<<<<< HEAD
			@buddies = current_user.buddies.first(4)
		end
=======
      @buddies = current_user.buddies
    end
>>>>>>> 9949868bc032b7bdd1fe4fdb5c4509b32c1a4cf6
  end

  def profile
    if signed_in?
      @user = current_user
    end
  end
end
