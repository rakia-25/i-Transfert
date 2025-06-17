class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.order(created_at: :desc)
    @transactions = @transactions.where(transaction_type: params[:type]) if params[:type].present?
  end

  def new
    @transaction = Transaction.new
    @transaction_type = params[:type] || 'envoi'
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction_type = @transaction.transaction_type
    if @transaction.save
      redirect_to transactions_path, notice: "Transaction #{ @transaction.transaction_type } réussie !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction supprimée avec succès.'
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :nom_expediteur,
      :numero_expediteur,
      :ville,
      :montant,
      :nom_destinataire,
      :numero_destinataire,
      :transaction_type,
      :montant_retrait
    )
  end
end
