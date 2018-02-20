class StrippersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @strippers = policy_scope(Stripper)
    @strippers = Stripper.all
  end

  def show
    @stripper = Stripper.find(params[:id])
    authorize @stripper
  end

  # def update
  #   @stripper = Stripper.find(params[:id])
  #   @stripper.update(set_params)
  #   redirect_to strippers_show_path(@stripper)
  # end

  # def edit
  #   @stripper = Stripper.find(params[:id])
  # end

  private

  def set_params
    params.require(:strippers).permit(:name, :price, :review, :city, :height, :hair_color, :eye_color, :ethnicity, :characters, :solo, :availability, :pics, :age)
  end
end
