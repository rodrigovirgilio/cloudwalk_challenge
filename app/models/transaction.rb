class Transaction < ApplicationRecord
  validates :transaction_id, :merchant_id, :user_id, :card_number,
    :transaction_date, :transaction_amount, :device_id, presence: true

  validates :transaction_id, uniqueness: true
end
