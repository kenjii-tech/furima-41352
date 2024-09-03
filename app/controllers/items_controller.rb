class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user # この行を追加
    if @item.save
      redirect_to root_path, notice: '商品が出品されました'
    else
      puts @item.errors.full_messages # デバッグ用：コンソールにエラーメッセージを出力
      flash.now[:alert] = '商品の出品に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :name, :Context, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price)
  end
end
