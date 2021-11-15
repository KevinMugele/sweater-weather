class ApiKey < ApplicationRecord
  belongs_to :user

  def self.api_token
    first.token
  end
end
