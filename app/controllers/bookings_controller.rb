class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :find_booking, only: [ :destroy, :show]

  def index
    @bookings = policy_scope(Booking)
    @user = current_user
  end

  def show
    @booking.stripper = @stripper

    #for maps integration:

    @markers =
      {
        lat: @booking.latitude,
        lng: @booking.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }

  end

  def new
    @stripper = Stripper.find(params[:stripper_id])
    @booking = Booking.new
    authorize @booking
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
    @booking.destroy
    redirect_to strippers_path
  end


  private

  def find_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:bookings).permit(:user_id, :stripper_id, :starts_at, :ends_at)
  end
end
