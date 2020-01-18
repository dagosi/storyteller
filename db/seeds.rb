ActiveRecord::Base.transaction do
  5.times do
    Story.create(name: Faker::Lorem.word)
  end

  articles = []
  100.times do
    articles << {
      name: Faker::Book.title,
      content: Faker::Books::Lovecraft.paragraphs(number: rand(1..5)).join("\n"),
      category: Article::CATEGORIES.sample,
      story: Story.all.sample
    }
  end

  Article.create(articles)
end
