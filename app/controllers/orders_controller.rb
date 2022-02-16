class OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:item_id, :order_id)
  end
end
