class City < ApplicationRecord
  belongs_to :country
  has_many :agencies, dependent: :nullify
  validates :name, presence: true
  validates :country_id, presence: true

end
