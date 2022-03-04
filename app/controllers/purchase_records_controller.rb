class PurchaseRecordsController < ApplicationController

  def index
    @purchase_purchase_record = PurchasePurchaseRecord.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_purchase_record = PurchasePurchaseRecord.new(purchase_record_params)
    if @purchase_purchase_record.valid?
      @purchase_purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_purchase_record).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
