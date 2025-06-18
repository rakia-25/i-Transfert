class Guichet < ApplicationRecord
   validates :name, presence: true
  belongs_to :agency
  belongs_to :user
end
