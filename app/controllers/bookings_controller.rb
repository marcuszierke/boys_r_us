class BookingsController < ApplicationController

  def index
    @stripper = Stripper.find(parmas[:stripper_id]) #how do we involve the user(_id) since we don't have a users-controller?
    @booking.stripper = @stripper    
    @bookings = Booking.all
  end

  def show
    find_booking
    @stripper = Stripper.find(parmas[:user_id])
    @booking.stripper = @stripper
  end

  def new
    @stripper = Stripper.find(parmas[:stripper_id])
    @booking = Booking.new
  end

  def create
    @stripper = Stripper.find(parmas[:stripper_id])
    @booking = Booking.new(booking_params)
    @booking.stripper = @stripper
    if @booking.save
      redirect_to bookings_path(@booking) #since we don't have a users-controller redirect_to the @booking page?
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
