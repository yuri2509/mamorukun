FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
    encrypted_password    {"00000000"}
  end
end
