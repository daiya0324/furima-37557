class PurchaseRecordsController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index
  def index
    @purchase_purchase_record = PurchasePurchaseRecord.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @purchase_purchase_record = PurchasePurchaseRecord.new(purchase_record_params)
    if @purchase_purchase_record.valid?
      pay_item
      @purchase_purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_purchase_record).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_record_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id && @item.purchase_record.nil?
  end
end
