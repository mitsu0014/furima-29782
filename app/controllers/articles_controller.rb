class ArticlesController < ApplicationController
  def new
    @article = Article.new(article_params)
  end

  private

  def article_params
    params.require(:article).permit(:title,:text,:genre_id,:postage_id,:category_id,:status_id,:shipping_origin_id,:shipping_date_id)
  end

end
