class Transaction < ApplicationRecord
  before_create :generate_reference
  TRANSACTION_TYPES = %w[envoi retrait].freeze
  
  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }

  validate :destinataire_exist, if: -> { transaction_type == 'retrait' }

  validates :sender_name, :sender_number, :destination, :amount, presence: true, if: :envoi?
  validates :recipient_number, presence: true, if: :retrait?

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

  def destinataire_exist
    unless Transaction.exists?(recipient_number: recipient_number, transaction_type: 'envoi')
      errors.add(:recipient_number, "n'existe pas pour un retrait")
    end
  end
end
