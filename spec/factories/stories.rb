FactoryBot.define do
  factory :story do
    name { Faker::Lorem.word }
  end
end
