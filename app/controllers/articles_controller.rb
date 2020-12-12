class ArticlesController < ApplicationController
  # before_action :set_article, only: [:show, :edit, :update, :delete]
  before_action :authorize_user, only: [:new, :create, :edit, :update, :delete]
  before_action :set_article, only: [:edit, :update, :delete]
  before_action :redirect_user_if_no_article, only: [:edit, :update, :delete]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    @tweet = Artile.new(article_params)
    @article.user = @current_user
    if @article.save
      redirect_to articles_path
    else
      redirect_to new_article_path, notice: 'Wrong'
    end


    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to @article, notice: 'Article was successfully created.' }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      redirect_to edit_article_path(@article), notice: 'Wrong'
    end

    # respond_to do |format|
    #   if @article.update(article_params)
    #     format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @article }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def delete
      @tweet.update(deleted_at: Time.now)
      redirect_to articles_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by(id: params[:id])
    end

    def authorize_user
      if @current_user.nil?
        redirect_to sign_in_path
      end
    end
  
    def redirect_user_if_no_tweet
      if @article.nil? || @current_user.id != @article.user.id
        redirect_to articles_path
      end
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end

