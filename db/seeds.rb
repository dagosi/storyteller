ActiveRecord::Base.transaction do
  5.times do |index|
    Story.create(name: "Lovecraft #{index + 1}")
  end

  articles = []
  50.times do
    articles << {
      name: Faker::Book.title,
      content: Faker::Books::Lovecraft.paragraphs(number: rand(1..10)).join("\n"),
      category: Article::CATEGORIES.sample,
      story: Story.all.sample
    }
  end

  Article.create(articles)
end
