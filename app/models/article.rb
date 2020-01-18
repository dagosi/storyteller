class Article < ApplicationRecord
  belongs_to :story

  CATEGORIES = %w[fantasy thriller adventure romance]
  validates :category, inclusion: { in: CATEGORIES }

  scope :by_name_or_text, ->(keyword) do
    where("name ILIKE :keyword OR content ILIKE :keyword", keyword: "%#{keyword}%")
  end
end
