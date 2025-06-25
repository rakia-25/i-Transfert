class TransfertsController < ApplicationController
  def index
    @transferts = Transfert.order(created_at: :desc)
    @transferts = @transferts.where(transaction_type: params[:type]) if params[:type].present?
  end

  def show
    @transaction = Transfert.find(params[:id])
  end

  def new
    @transfert = Transfert.new
    @transaction_type = 'sending'
  end

  def create
    @transfert = Transfert.new(transfert_params)
    @transaction_type = @transfert.transaction_type
    if @transfert.save
      redirect_to transferts_path, notice: "transfert #{ @transfert.transaction_type } réussie !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @transfert = Transfert.find(params[:id])
    @transfert.destroy
    redirect_to transferts_url, notice: 'transfert supprimée avec succès.'
  end

  private 
  

  def transfert_params
    params.require(:transfert).permit(
      :sender_name,
      :sender_number,
      :destination,
      :amount,
      :recipient_name,
      :recipient_number,
      :transaction_type,
    )
  end
end
