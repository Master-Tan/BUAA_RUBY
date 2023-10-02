class User < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  has_many :help_delivery_items, dependent: :destroy
  has_many :transaction_items, dependent: :destroy
  has_many :transaction_orders, dependent: :destroy
  has_many :user_logs, dependent: :destroy
  has_many :user_search_records, dependent: :destroy

  has_secure_password

  before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
    end
  end

  def reset_auth_token!
    generate_authentication_token
    save
  end
end
