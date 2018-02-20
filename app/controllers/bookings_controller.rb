class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def index
    @stripper = Stripper.find(params[:stripper_id]) #how do we involve the user(_id) since we don't have a users-controller?
    @booking.stripper = @stripper
    @bookings = Booking.all
  end

  def show
    find_booking
    @stripper = Stripper.find(params[:stripper_id])
    @booking.stripper = @stripper
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
      redirect_to strippers_path(@stripper) #since we don't have a users-controller redirect_to the @booking page?
    end
  end


  def destroy
    find_booking
    @booking.destroy
    redirect_to strippers_path
  end


  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:bookings).permit(:user_id, :stripper_id, :starts_at, :ends_at)
  end
end
