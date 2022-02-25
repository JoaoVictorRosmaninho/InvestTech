class CashTransactionsController < ApplicationController
  before_action :set_cash_transaction, only: %i[ show edit update destroy ]

  # GET /cash_transactions or /cash_transactions.json
  def index
    render json: CashTransaction.select("name_fund, desc_transaction, valor_transaction, data_transection").joins(:fund);
  end

  # GET /cash_transactions/1 or /cash_transactions/1.json
  def show
  end

  # GET /cash_transactions/new
  def new
    @cash_transaction = CashTransaction.new
  end

  # GET /cash_transactions/1/edit
  def edit
  end

  # POST /cash_transactions or /cash_transactions.json
  def create
    @cash_transaction = CashTransaction.new(cash_transaction_params)

    respond_to do |format|
      if @cash_transaction.save
        format.html { redirect_to cash_transaction_url(@cash_transaction), notice: "Cash transaction was successfully created." }
        format.json { render :show, status: :created, location: @cash_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cash_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_transactions/1 or /cash_transactions/1.json
  def update
    respond_to do |format|
      if @cash_transaction.update(cash_transaction_params)
        format.html { redirect_to cash_transaction_url(@cash_transaction), notice: "Cash transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @cash_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cash_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_transactions/1 or /cash_transactions/1.json
  def destroy
    @cash_transaction.destroy

    respond_to do |format|
      format.html { redirect_to cash_transactions_url, notice: "Cash transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_transaction
      @cash_transaction = CashTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cash_transaction_params
      params.require(:cash_transaction).permit(:desc_transaction, :valor_transaction, :data_transection, :fund_id)
    end
end
