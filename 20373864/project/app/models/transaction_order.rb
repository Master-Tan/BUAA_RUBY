class TransactionOrder < ApplicationRecord
  has_many :delivery_orders, dependent: :destroy
  has_many :order_platforms, dependent: :destroy
  has_many :transaction_items, dependent: :destroy

  belongs_to :user
  belongs_to :shop
end
