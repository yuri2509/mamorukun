FactoryBot.define do

  factory :message do
    content              {"test"}
    image                { "banana.png" }
    created_at           { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }

    user
  end

end
