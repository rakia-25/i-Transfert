class GuichetsController < ApplicationController

    def create
        @agency=Agency.find(params[:agency_id])
        @guichet=@agency.guichets.new(guichet_params)
        if @guichet.save
            redirect_to agency_path(@agency), notice: "guichet ajouter avec succés"
        else
            render "agencies/show", status: :unprocessable_entity
        end
    end

    def edit
        @agency=Agency.find(params[:agency_id])
        @guichet=@agency.guichets.find(params[:id])
        @users=User.agent
        render "agencies/show"
    end

    def update
        @agency=Agency.find(params[:agency_id])
        @guichet=@agency.guichets.find(params[:id])
        if @guichet.update(guichet_params)
            redirect_to agency_path(@agency), notice: "guichet modifier avec succes"
        else
             render "agencies/show", status: :unprocessable_entity
        end 

    end

    def destroy 
        @agency=Agency.find(params[:agency_id])
        @guichet=@agency.guichets.find(params[:id])
        @guichet.destroy
        redirect_to agency_path(@agency)
    end

    private
    def guichet_params
    params.require(:guichet).permit(:name, :address, :solde, :user_id)
  end
end
