class HelpDeliveryItem < ApplicationRecord
  belongs_to :user
  belongs_to :help_delivery_order
end
