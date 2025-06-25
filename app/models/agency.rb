class Agency < ApplicationRecord

    has_many :guichets,dependent: :restrict_with_exception

    belongs_to :city

    validates :name, presence: true
end
