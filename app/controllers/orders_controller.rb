class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_id, only: [:index, :create]

  def index
    redirect_to root_path if @item.user_id == current_user.id || !@item.order.nil?
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_buyer).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :address,
      :building_name,
      :telephone_num
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
