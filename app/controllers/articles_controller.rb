class ArticlesController < ApplicationController
  # before_action :move_to_index, except: [:index]
#
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
 
  end

  private

  def article_params
    params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
  end

  def move_to_index 
    unless user_signed_in?
      redirect_to action: :index      
    end
  end 

end
