class User < ApplicationRecord
  has_many :api_keys
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password_confirmation, presence: true

  after_commit :create_api_key, on: :create

  def api_key
    api_keys.api_token
  end

  private

  def create_api_key
    ApiKey.create!(user: self, token: SecureRandom.hex)
  end
end
