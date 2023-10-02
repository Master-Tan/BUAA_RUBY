class Shop < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :shop_logs, dependent: :destroy
  has_many :transaction_orders, dependent: :destroy

  belongs_to :canteen

  has_one_attached :image

  before_create :generate_authentication_token

  has_secure_password

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless Shop.find_by(authentication_token: authentication_token)
    end
  end

  def reset_auth_token!
    generate_authentication_token
    save
  end
end
