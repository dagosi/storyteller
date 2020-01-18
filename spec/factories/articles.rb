FactoryBot.define do
  factory :article do
    story

    name { Faker::Book.title }
    content { Faker::Books::Lovecraft.paragraphs(number: rand(1..5)).join("\n") }
    category { Article::CATEGORIES.sample } 
  end
end
