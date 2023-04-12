class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  enum status: {
    active:    0,
    cancelled: 1
  }

  enum frequency: {
    annual:   0,
    biannual: 1,
    monthly:  2
  }
end
