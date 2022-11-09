class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products


  def item_count
    cart_products.not_purchased.count
  end

  def total_price
    cart_products.not_purchased.map(&:product).sum(&:price)
  end
end
