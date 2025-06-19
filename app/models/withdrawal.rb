class Withdrawal < ApplicationRecord
  belongs_to :identity_type
  belongs_to :user
end
