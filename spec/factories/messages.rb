FactoryBot.define do

  factory :message do
    id                   {'1'}
    content              {"test"}
    image                { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/banana.png')) }
    user_id              {"1"}

    user
  end

end