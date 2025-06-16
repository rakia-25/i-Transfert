class AgenciesController < ApplicationController
    before_action :set_agency, only: %i[ show edit update destroy ]

    def index
        @agencies=Agency.all
    end

    def new 
        @agency= Agency.new
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
        params.require(:agency).permit(:name, :location)
    end
end
