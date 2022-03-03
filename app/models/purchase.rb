class Purchase < ApplicationRecord
  belongs_to :purchase_records
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :purchase_record, presence: true




  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
