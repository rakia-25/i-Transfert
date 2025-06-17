class CitiesController < ApplicationController
  def new
    @country = Country.find(params[:country_id])
    @city = @country.cities.new
  end

  def create
    @country = Country.find(params[:country_id])
    @city = @country.cities.new(city_params)
    if @city.save
      redirect_to country_path(@country), notice: "Ville ajoutée avec succès."
    else
      render :new
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end

end
