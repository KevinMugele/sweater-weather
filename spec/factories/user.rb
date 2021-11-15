FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'qhiuowe' }
    password_confirmation { password }
  end
end
