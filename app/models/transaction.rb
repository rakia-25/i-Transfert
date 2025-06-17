class Transaction < ApplicationRecord
  before_create :generate_reference
  TRANSACTION_TYPES = %w[envoi retrait].freeze
  
  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }

  validate :destinataire_existe_pour_retrait, if: -> { transaction_type == 'retrait' }

  validates :nom_expediteur, :numero_expediteur, :ville, :montant, presence: true, if: :envoi?
  validates :numero_destinataire, :montant_retrait, presence: true, if: :retrait?

  scope :envois, -> {where(transaction_type: 'envoi')}
  scope :retraits, -> {where(transaction_type: 'retrait')}

  def envoi?
    transaction_type =='envoi'
  end

  def retrait?
    transaction_type == 'retrait'
  end


  private

  def generate_reference
    self.reference = "I#{SecureRandom.random_number(1_000_000..9_999_999)}"
  end

  def destinataire_existe_pour_retrait
    unless Transaction.exists?(numero_destinataire: numero_destinataire, transaction_type: 'envoi')
      errors.add(:numero_destinataire, "n'existe pas pour un retrait")
    end
  end
end
