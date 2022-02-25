class SecuritysClosingPricesController < ApplicationController
  before_action :set_securitys_closing_price, only: %i[ show edit update destroy ]

  # GET /securitys_closing_prices or /securitys_closing_prices.json
  def index
    @securitys_closing_prices = SecuritysClosingPrice.all
  end

  # GET /securitys_closing_prices/1 or /securitys_closing_prices/1.json
  def show
  end

  # GET /securitys_closing_prices/new
  def new
    @securitys_closing_price = SecuritysClosingPrice.new
  end

  # GET /securitys_closing_prices/1/edit
  def edit
  end

  # POST /securitys_closing_prices or /securitys_closing_prices.json
  def create
    @securitys_closing_price = SecuritysClosingPrice.new(securitys_closing_price_params)

    respond_to do |format|
      if @securitys_closing_price.save
        format.html { redirect_to securitys_closing_price_url(@securitys_closing_price), notice: "Securitys closing price was successfully created." }
        format.json { render :show, status: :created, location: @securitys_closing_price }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @securitys_closing_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securitys_closing_prices/1 or /securitys_closing_prices/1.json
  def update
    respond_to do |format|
      if @securitys_closing_price.update(securitys_closing_price_params)
        format.html { redirect_to securitys_closing_price_url(@securitys_closing_price), notice: "Securitys closing price was successfully updated." }
        format.json { render :show, status: :ok, location: @securitys_closing_price }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @securitys_closing_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securitys_closing_prices/1 or /securitys_closing_prices/1.json
  def destroy
    @securitys_closing_price.destroy

    respond_to do |format|
      format.html { redirect_to securitys_closing_prices_url, notice: "Securitys closing price was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_securitys_closing_price
      @securitys_closing_price = SecuritysClosingPrice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def securitys_closing_price_params
      params.require(:securitys_closing_price).permit(:closing_price, :date_closing, :security_id)
    end
end
