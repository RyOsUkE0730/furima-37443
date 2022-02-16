class Buyer < ApplicationRecord
  belongs_to : order

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :municipalities 
    validates :address
    validates :telephone_num
  end
end
