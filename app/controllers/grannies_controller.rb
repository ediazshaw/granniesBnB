class GranniesController < ApplicationController
  def index
    @grannies = Granny.all
  end

  def show
    @granny = Granny.find(params[:id])
    @booking = Booking.new
  end

  def new
    @granny = Granny.new
  end

  def create
    @granny = Granny.new(granny_params)
    @granny.user = current_user
    if @granny.save
      redirect_to granny_path(@granny)
    else
      render :new
    end
  end

  private

  def granny_params
    params.require(:granny).permit(:name, :city, :age, :description, :price, :photo)
  end
end
