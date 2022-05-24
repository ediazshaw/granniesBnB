class GranniesController < ApplicationController
  def index
    @grannies = Granny.all
  end

  def show
    @granny = Granny.find(params[:id])
  end
end
