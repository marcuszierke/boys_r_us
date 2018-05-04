class StrippersController < ApplicationController
  def index
    @strippers = policy_scope(Stripper)
    @strippers = Stripper.all
    if params[:query].present?
      @strippers = Stripper.where("city ILIKE ?", "%#{params[:query]}%")
    else
      @strippers = Stripper.all
    end
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

  def edit
    @stripper = Stripper.find(params[:id])
  end

  private

  def set_params
    params.require(:strippers).permit(
      :name,
      :price,
      :review,
      :city,
      :height,
      :hair_color,
      :eye_color,
      :ethnicity,
      :characters,
      :solo,
      :availability,
      :age,
      :pics1,
      :pics2,
      :pics3,
      :pics4
      )
  end
end
