class CartProductsController < ApplicationController
  before_action :authenticate_user

  def create
    cart_product = CartProduct.new(cart_product_params)
    cart_product.cart_id = @current_user.cart.id
    if cart_product.save
      render json: cart_product
    else
      render json: { errors: cart_product.errors.full_messages }, status: 422
    end
  end

  def cart_product_params
    params.require(:cart_product).permit(:product_id)
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    render json: cart_product
  end
end
