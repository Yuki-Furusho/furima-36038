class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prov_id, :city, :address, :building, :phone

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prov_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A[0-9]{10,11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prov_id: prov_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end