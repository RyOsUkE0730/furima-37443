class Buyer < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_num
  belongs_to :order

  with_options presence: true do
    validates :post_code, format: { with:  }
    validates :prefecture_id numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :telephone_num,format: { with:  }
  end


  def save
    order = Order.create( item_id: item_id, order_id: order_id )
    Buyer.create( post_code: post_code, preprefecture_id: prefecture_id, municipalities: municipalities, building_name: building_name, address: address, telephone_num: telephone_num, order_id: order.id )
  end
end
