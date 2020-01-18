class ArticlesController < ApplicationController
  def index
    article_management_service = ArticleManagementService.new(params.dup)
    @articles = article_management_service.call

    render json: @articles
  end
end
