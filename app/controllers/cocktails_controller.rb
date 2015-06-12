class CocktailsController < ApplicationController
  def show
    @cocktail = Cocktail.find(params[:id])
    # @reviews = Review.find_by()
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def index
    @cocktails = Cocktail.all
  end


  def destroy
    @cocktail = Cocktail.find(params[:index])
    @cocktail.destroy
    # redirect_to cocktails_path
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

# use in Dose controller
  # def create
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @cocktail.doses.build(dose_params)
  # end

  # def dose_params
  #   params.require(:dose).permit(:ingredient_id)
  # end
