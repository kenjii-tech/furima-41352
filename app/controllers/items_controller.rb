class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

  # skip_before_action :authenticate_user!, only: [:index]
  before_action :ensure_correct_user, except: [:index, :show]

  def index
    @items = Item.with_attached_image.order(created_at: :desc)
    # @items = Item.order(created_at: :desc)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :Context, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_correct_user
    return if current_user == @item.user

    redirect_to items_path, alert: 'この商品の編集権限がありません'
  end
end
