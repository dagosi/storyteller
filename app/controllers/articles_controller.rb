class ArticlesController < ApplicationController
  def index
    article_management_service = ArticleManagementService.new(params.dup)
    article_management_service.call

    @articles = article_management_service.articles
    @story_articles = article_management_service.story_articles
    @story_totals = article_management_service.story_totals
  end
end
