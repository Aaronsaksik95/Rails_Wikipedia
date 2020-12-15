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

  # GET /historicals/1/edit
  # def edit
  # end

  # POST /historicals
  # POST /historicals.json
  # def create
  #   @historical = Historical.new(historical_params)
    
  #   respond_to do |format|
  #     if @historical.save
  #       format.html { redirect_to @historical, notice: 'Historical was successfully created.' }
  #       format.json { render :show, status: :created, location: @historical }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @historical.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /historicals/1
  # PATCH/PUT /historicals/1.json
  # def update
  #   respond_to do |format|
  #     if @historical.update(historical_params)
  #       format.html { redirect_to @historical, notice: 'Historical was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @historical }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @historical.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /historicals/1
  # DELETE /historicals/1.json
  # def destroy
  #   @historical.destroy
  #   respond_to do |format|
  #     format.html { redirect_to historicals_url, notice: 'Historical was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical
      @historical = Historical.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def historical_params
    #   params.require(:historical).permit(:title, :content)
    # end
end
