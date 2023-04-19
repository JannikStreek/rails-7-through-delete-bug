class Deal < ApplicationRecord
  has_one :loan
  has_one :fee
end
