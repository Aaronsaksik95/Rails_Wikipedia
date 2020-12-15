class ArticlesController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_user_if_no_article, only: [:destroy]

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
    @historical = Historical.new(article_params)
    @historical.user_id = @current_user.id
    @historical.article_id = @article.id
    @historical.save
  end

  def edit
  end

  def update
    if @article.update(article_params)
      @historical = Historical.new(article_params)
      @historical.user_id = @current_user.id
      @historical.article_id = @article.id
      @historical.save
      UserMailer.with(
        author: @article.user, 
        editor: @current_user, 
        date: @article.updated_at
      ).notif_update.deliver_later
      redirect_to articles_path 
    else
      redirect_to edit_article_path(@article), notice: 'Wrong'
    end
  end

  def destroy
    @historical = Historical.where(article_id: @article.id)
    @historical.destroy_all
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
