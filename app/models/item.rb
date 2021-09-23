class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prov
  belongs_to :ship_days

  belongs_to :user

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prov_id
    validates :ship_days_id
    validates :price, format: { with: /\A\d+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :user
  end

  validates :category_id, numericality: { other_than: 1, message: "選択してください"}
  validates :condition_id, numericality: { other_than: 1, message: "選択してください"}  
  validates :delivery_fee_id, numericality: { other_than: 1, message: "選択してください"}  
  validates :prov_id, numericality: { other_than: 1, message: "選択してください"}  
  validates :ship_days_id, numericality: { other_than: 1, message: "選択してください"}  

end
