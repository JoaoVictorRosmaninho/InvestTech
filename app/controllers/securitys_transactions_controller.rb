class SecuritysTransactionsController < ApplicationController
  before_action :set_securitys_transaction, only: %i[ show edit update destroy ]

  # GET /securitys_transactions or /securitys_transactions.json
  def index
    render json: SecuritysTransaction.select("name_fund, desc_transaction, value_transaction, security_simbol, date_transaction").joins(:fund, :security);
  end

  # GET /securitys_transactions/1 or /securitys_transactions/1.json
  def show
  end

  # GET /securitys_transactions/new
  def new
    @securitys_transaction = SecuritysTransaction.new
  end

  # GET /securitys_transactions/1/edit
  def edit
  end

  # POST /securitys_transactions or /securitys_transactions.json
  def create
    @securitys_transaction = SecuritysTransaction.new(securitys_transaction_params)

    respond_to do |format|
      if @securitys_transaction.save
        format.html { redirect_to securitys_transaction_url(@securitys_transaction), notice: "Securitys transaction was successfully created." }
        format.json { render :show, status: :created, location: @securitys_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @securitys_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securitys_transactions/1 or /securitys_transactions/1.json
  def update
    respond_to do |format|
      if @securitys_transaction.update(securitys_transaction_params)
        format.html { redirect_to securitys_transaction_url(@securitys_transaction), notice: "Securitys transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @securitys_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @securitys_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securitys_transactions/1 or /securitys_transactions/1.json
  def destroy
    @securitys_transaction.destroy

    respond_to do |format|
      format.html { redirect_to securitys_transactions_url, notice: "Securitys transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_securitys_transaction
      @securitys_transaction = SecuritysTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def securitys_transaction_params
      params.require(:securitys_transaction).permit(:desc_transaction, :value_transaction, :date_transaction, :fund_id, :security_id)
    end
end
