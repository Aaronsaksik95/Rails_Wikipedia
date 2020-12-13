class ArticlesController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user_if_no_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = @current_user
    if @article.save
      redirect_to articles_path
    else
      redirect_to new_article_path, notice: 'Wrong'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      redirect_to edit_article_path(@article), notice: 'Wrong'
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def authorize_user
    if @current_user.nil?
      redirect_to sign_in_path
    end
  end

  def redirect_user_if_no_article
    if @article.nil? || @current_user.id != @article.user.id
      redirect_to articles_path
    end
  end

  def article_params
    params.require(:article).permit(:content, :title)
  end
end
