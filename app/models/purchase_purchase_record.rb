class PurchasePurchaseRecord
  include ActiveModel::Model 
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id, :token

  validates :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end