class Withdraw < ApplicationRecord
    has_one :historical, as: :operation

end
