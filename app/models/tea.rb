class Tea < ApplicationRecord
  has_many :subscriptions

  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, presence: true
  validates :brew_time, presence: true

  enum temperature: {
    hot: 0,
    cold: 1
  }
end
