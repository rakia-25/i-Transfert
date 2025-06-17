class Guichet < ApplicationRecord
  belongs_to :agency
  belongs_to :user
end
