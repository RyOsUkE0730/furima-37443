class Buyer < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :telephone_num
  belongs_to :order

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :telephone_num,format: { with: /\A\d{3}[-]\d{4}\z/ }
  end

  def save
    Order.create( item_id: item_id, order_id: order_id )
    Buyer.create( post_code: post_code, preprefecture_id: prefecture_id, municipalities: municipalities, address: address, telephone_num: telephone_num )
  end
end
