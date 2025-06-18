class Agency < ApplicationRecord
    has_many :guichets,dependent: :restrict_with_exception
    validates :name, presence: true
end
