FactoryBot.define do

  factory :message do
    id                   {'1'}
    content              {"test"}
    image                {"app/assets/images/banana.png"}
    user_id              {"1"}
    created_at            {'2021-01-12 12:36:35'}
    updated_at            {'2021-01-12 12:36:35'}

  end

end