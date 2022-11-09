class ProductsController < ApplicationController
    def index
        products = Product.all
        render json: products
      end

      def show
        product = Product.find_by(id: params[:id])
        if product
            render json: product
          else 
            render json: { message: 'Product not found' }
          end 
      end
end
