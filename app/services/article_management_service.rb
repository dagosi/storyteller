class ArticleManagementService
  def initialize(search_params)
    @search_params = search_params
    @articles = Article.all
  end

  def call
    @articles = search_by_name_or_text
    @articles = sort_by_field
    @articles = group_by_field
    @articles = group_by_story_with_totals
    @articles
  end

  private

  def search_by_name_or_text
    keyword = @search_params[:keyword]
    return @articles unless keyword

    @articles.by_name_or_text(keyword)
  end

  def sort_by_field
    sort_field = @search_params[:sort]
    return @articles unless sort_field

    @articles.order(sort_field)
  end

  def group_by_field
    group_field = @search_params[:group]
    return @articles unless group_field

    if group_field.to_sym == :story
      @articles.group_by_story
    else
      @articles.group_by(&:"#{group_field}")
    end
  end

  def group_by_story_with_totals
    group_totals = @search_params[:group_totals]&.to_sym
    return @articles unless group_totals

    if group_totals == :article
      @articles.group_by_story_count
    elsif group_totals == :article_type
      @articles.group_by_category_count
    elsif group_totals == :last_created
      @articles.group_by_story_last_created
    end
  end
end
