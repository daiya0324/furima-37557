class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase

  validates :user, :item, presence: true
end
