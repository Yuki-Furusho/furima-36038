class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prov_id
    validates :ship_days_id
    validates :price
    validates :user
  end
end
