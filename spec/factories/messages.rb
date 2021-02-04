FactoryBot.define do

  factory :message do
    content              {"test"}
    image                { "banana.png" }

    user
  end

end
