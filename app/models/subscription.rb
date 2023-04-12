class Subscription < ApplicationRecord
  has_many :cust_subs, dependent: :destroy
  has_many :customers, through: :cust_subs
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
