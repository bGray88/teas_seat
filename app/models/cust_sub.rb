class CustSub < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
end
