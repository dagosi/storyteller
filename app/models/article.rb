class Article < ApplicationRecord
  belongs_to :story

  CATEGORIES = %w[fantasy thriller adventure romance]
  validates :category, inclusion: { in: CATEGORIES }

  scope :by_name_or_text, ->(keyword) do
    where("name ILIKE :keyword OR content ILIKE :keyword", keyword: "%#{keyword}%")
  end

  scope :group_by_story, -> { includes(:story).group_by(&:story) }
  scope :group_by_story_count, -> { includes(:story).group(:story).count }
  scope :group_by_category_count, -> {
    joins(:story).group('stories.id', 'stories.name', :category).count.sort
  }
  scope :group_by_story_last_created, -> {
    story_articles_hash = order(created_at: :desc).group_by(&:story)
    story_articles_hash.each do |story, articles|
      story_articles_hash[story] = articles.first
    end
  }
end
