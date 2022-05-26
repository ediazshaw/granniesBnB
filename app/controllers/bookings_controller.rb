class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    # we need `granny_id` to associate booking with corresponding granny
    @granny = Granny.find(params[:granny_id])
    @booking.granny = @granny
    @booking.user = current_user
    @booking.save
    redirect_to profile_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:initial_date, :final_date, :num_grandsons)
  end
end
