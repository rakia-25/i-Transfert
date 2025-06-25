class Transfert < ApplicationRecord
  before_create :generate_reference
  TRANSACTION_TYPES = %w[sending withdrawal].freeze
  
  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }
  validates :sender_name, :sender_number, :recipient_number, :recipient_name, :destination, :amount, presence: true, if: :sending?

  scope :sending, -> {where(transaction_type: 'sending')}

  def sending?
    transaction_type =='sending'
  end

  private

  def generate_reference
    self.reference = "I--#{SecureRandom.random_number(1_000_000..9_999_999)}"
  end
end
