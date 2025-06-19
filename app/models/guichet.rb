class Guichet < ApplicationRecord
  validates :solde, numericality: { greater_than_or_equal_to: 0, message: "ne peut pas être négatif" }
  belongs_to :agency
  belongs_to :user
end
