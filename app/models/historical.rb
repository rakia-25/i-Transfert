class Historical < ApplicationRecord
  belongs_to :guichet
  belongs_to :operation, polymorphic: true
end
