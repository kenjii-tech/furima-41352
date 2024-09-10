class OrdersController < ApplicationController
  before_action :authenticate_user! # ログイン状態を確認
  before_action :set_item, only: [:index, :create]
  before_action :check_item_owner, only: [:index]
  before_action :check_if_sold_out

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @formobject = Formobject.new
  end

  def create
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @formobject = Formobject.new(formobject_params)

    if @formobject.valid?

      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: formobject_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @formobject.save
      redirect_to root_path, notice: '注文が作成されました。'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_if_sold_out
    return unless @item.sold_out?

    redirect_to root_path, alert: 'この商品は既に売却済みです。'
  end

  def check_item_owner
    return unless current_user.id == @item.user_id

    redirect_to root_path, alert: '自身が出品した商品の購入ページには遷移できません。'
  end

  def formobject_params
    params.require(:formobject).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
