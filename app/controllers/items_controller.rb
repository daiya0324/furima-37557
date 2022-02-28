class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destory]
  before_action :set_tweet, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:destroy, :edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
