class Agency < ApplicationRecord
    has_many :guichets,dependent: :destroy
    validates :name, presence: true
end
