class AgenciesController < ApplicationController
    before_action :set_agency, only: %i[ show edit update destroy ]

    def index
        @agencies=Agency.all
    end

    def new 
        @agency= Agency.new
        @countries = Country.all
        @cities = []
        if params[:country_id].present?
            @selected_country = Country.find(params[:country_id])
            @cities = @selected_country.cities
        end
    end

    def create
        @agency=Agency.new(agency_params)
        if @agency.save 
            redirect_to agencies_path, notice:"agence creer avec succes"
        else
            render :new ,status: :unprocessable_entity
        end
    end
    def show 
        @agency = Agency.includes(city: :country).find(params[:id])

    end

    def edit
    end

    def update
        if @agency.update(agency_params)
            redirect_to @agency, notice: "agence modifier avec succes"
        else
            render :edit,status: :unprocessable_entity
        end
    end

    def destroy 
        @agency.destroy
        redirect_to agencies_path
    end

    private
    def set_agency
        @agency = Agency.find(params[:id])
    end

    private
    def agency_params
        params.require(:agency).permit(:name, :city_id)
    end
end
