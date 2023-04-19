class Fee < ApplicationRecord
  belongs_to :deal
  has_one :loan, through: :deal
end
