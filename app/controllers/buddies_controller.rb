class BuddiesController < ApplicationController
  before_action :set_buddy, only: [:show, :edit, :update, :destroy]

  def index
    @buddies = current_user.buddies
  end

  def show
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @safe_places = current_user.safe_places
    @buddy = Buddy.create(buddy_params)
    @buddy.user = current_user
    if @buddy.save
      if @safe_places.count.zero?
        redirect_to add_safe_place_intro_path
      else
        flash[:success] = "Buddy successfully created"
        redirect_to @buddy
      end
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @buddy.update!(buddy_params)
      flash[:success] = "Buddy was successfully updated"
      redirect_to @buddy
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @buddy.destroy
    if @buddy.destroy
      flash[:success] = 'Buddy was successfully deleted.'
      redirect_to buddies_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to buddies_path
    end
  end

  private

  def set_buddy
    @buddy = Buddy.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:name, :phone_number, :profile_picture, :user_id)
  end
end
