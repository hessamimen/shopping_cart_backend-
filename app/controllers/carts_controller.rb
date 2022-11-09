class CartsController < ApplicationController
  before_action :authenticate_user

  def show
    cart = @current_user.cart
    render json: {
      total_price: cart.total_price,
      item_count: cart.item_count,
      items: cart.cart_products.not_purchased.map do |cart_product|
        {
          id: cart_product.id,
          title: cart_product.product.title,
          price: cart_product.product.price,
          image: cart_product.product.image,
          category: cart_product.product.category,
        }
      end
    }
  end

  def checkout
    cart = @current_user.cart
    cart.cart_products.not_purchased.each do |cart_product|
      cart_product.update(purchased: true)
    end

    render json: {message: 'Purchase complete'}
  end

  def clear
    cart = @current_user.cart
    cart.cart_products.not_purchased.each do |cart_product|
      cart_product.destroy
    end

    render json: {message: 'Cart cleared'}
  end
end
