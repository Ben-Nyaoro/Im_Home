class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    add_buddy_intro_path
  end
end
