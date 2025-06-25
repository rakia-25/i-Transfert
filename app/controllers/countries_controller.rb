class CountriesController < ApplicationController
    before_action :set_country, only: [:show, :edit, :update, :destroy]

    def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @cities = @country.cities
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to @country, notice: "Pays créé avec succès."
    else
      render :new
    end
  end
  
 def edit; end

  def update
    if @country.update(country_params)
      redirect_to @country, notice: "Pays mis à jour avec succès"
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_path, notice: "Pays supprimé avec succès"
  end

  private

  
  def set_country
    @country = Country.find(params[:id])
  end
  
  def country_params
    params.require(:country).permit(:name)
  end
end
