class DosesController < ApplicationController

  def show
    @dose = Dose.find(params[:id])
    # @reviews = Review.find_by()
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def index
    @doses = Dose.all
  end


  def destroy
    # @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])
    @dose.destroy!
    # redirect_to cocktail_path(@cocktail)
    redirect_to root_path
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
