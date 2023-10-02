class DeliveryOrder < ApplicationRecord
  belongs_to :transaction_order
end
