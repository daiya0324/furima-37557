class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee_burden, :prefecture, :shipping_date

  validates :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true,greater_than: 299, less_than: 10000000}
end
