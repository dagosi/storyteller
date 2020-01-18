class ArticleManagementService
  def initialize(search_params)
    @search_params = search_params
    @articles = Article.all
  end

  def call
    @articles = search_by_name_or_text
    @articles = sort_by
    @articles
  end

  private

  def search_by_name_or_text
    keyword = @search_params[:keyword]
    return @articles unless keyword

    @articles.by_name_or_text(keyword)
  end

  def sort_by
    sort_field = @search_params[:sort]
    return @articles unless sort_field

    @articles.order(sort_field)
  end

  def group_by(field)

  end

  def group_by_with_totals(field)

  end
end
