class HistoricalsController < ApplicationController
  before_action :set_historical, only: [:show]

  # GET /historicals
  # GET /historicals.json
  def index
    # @historicals = Historical.all
    @historicals = Historical.where(article_id: params[:id])

  end

  # GET /historicals/1
  # GET /historicals/1.json
  def show
  end

  # GET /historicals/new
  def new
    @historical = Historical.new
  end

  def retrieve_history
    @historical = Historical.find(params[:id])
    @article = Article.find(@historical.article_id)
    @article.update_attribute('title', @historical.title)
    @article.update_attribute('content', @historical.content)
    redirect_to articles_path 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical
      @historical = Historical.find(params[:id])
    end
end
