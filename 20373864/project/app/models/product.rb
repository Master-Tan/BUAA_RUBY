class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :transaction_items, dependent: :destroy

  belongs_to :shop

  has_one_attached :image

end
