FactoryBot.define do

  factory :user do
    # nickname              {"abe"}
    # email                 {"kkk@gmail.com"}

    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
    encrypted_password    {"00000000"}

    # password = Faker::Internet.password(min_length: 8)
    # name {Faker::Name.last_name}
    # email {Faker::Internet.free_email}
    # password {password}
    # password_confirmation {password}
  end

end
