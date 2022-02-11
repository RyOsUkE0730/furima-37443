class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :selling_price
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
  end 
end
