class Transfert < ApplicationRecord
  before_create :generate_reference
  has_one :historical, as: :operation

  
  validates :sender_name, :sender_number, :recipient_number, :recipient_name, :destination, :amount, presence: true

  scope :sending, -> {where(transaction_type: 'sending')}

 

  private

  def generate_reference
    self.reference = "I--#{SecureRandom.random_number(1_000_000..9_999_999)}"
  end
end
