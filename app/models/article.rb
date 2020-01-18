class Article < ApplicationRecord
  belongs_to :story

  CATEGORIES = %w[fantasy thriller adventure romance]
  validates :category, inclusion: { in: CATEGORIES }
end
