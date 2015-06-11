class DosesController < ApplicationController

  def show
    @dose = Dose.find(params[:id])
    # @reviews = Review.find_by()
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def index
    @doses = Dose.all
  end


  # def destroy
  #   @cocktail = Cocktail.find(params[:index])
  #   @cocktail.destroy
  #   redirect_to cocktails_path
  # end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
