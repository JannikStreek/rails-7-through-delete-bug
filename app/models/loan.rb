class Loan < ApplicationRecord
  belongs_to :deal
  has_one :fee, through: :deal
end
