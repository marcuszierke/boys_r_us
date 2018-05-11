class BookingsController < ApplicationController
  before_action :find_booking, only: [ :destroy, :show]

  def index
    @bookings = Booking.all
    @user = current_user
  end

  def show
    @markers =
      [{
        lat: @booking.latitude,
        lng: @booking.longitude,
        icon: ActionController::Base.helpers.asset_path("map-heart2.png")
      }]
  end

  def new
    @stripper = Stripper.find(params[:stripper_id])
    @booking = Booking.new
  end

  def create
    @stripper = Stripper.find(params[:stripper_id])
    @booking = Booking.new(booking_params)
    @booking.stripper = @stripper
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking) #since we don't have a users-controller redirect_to the @booking page?
    end
  end


  def destroy
    @booking.destroy
    redirect_to bookings_path
  end


  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :stripper_id, :duration, :date, :character, :address)
  end
end
