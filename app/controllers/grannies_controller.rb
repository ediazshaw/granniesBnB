class GranniesController < ApplicationController
  def index
    @abilities = Ability.all
    if params[:query].present?
      @city = params[:query]
      @grannies = Granny.city_search(params[:query])
      if params[:ability].present?
        @grannies = Ability.find_by(name: params[:ability]).grannies.city_search(params[:query])
      else
        @grannies = Granny.city_search(params[:query])
      end
    else
      @grannies = Granny.all
    end
  end

  def show
    @granny = Granny.find(params[:id])
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
