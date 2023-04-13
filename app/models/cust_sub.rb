class CustSub < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  validates :status, presence: true

  enum status: {
    active:    0,
    cancelled: 1
  }

  def self.valid_status(status)
    self.statuses.include?(status)
  end
end
