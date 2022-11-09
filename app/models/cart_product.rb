class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  scope :purchased, -> { where(purchased: true) }
  scope :not_purchased, -> { where.not(purchased: true) }
end
