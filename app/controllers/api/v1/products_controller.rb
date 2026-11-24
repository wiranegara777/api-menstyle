module Api
    module V1
        class ProductsController < ApplicationController

        def index
            # products = ProductFilterService.execute(params)

            # return json: products, each_serializer: ProductSerializer
        end

        def show
            product = Product.find_by(id: params[:id])

            raise CustomError.new(
                status: :not_found,
                error: "Not Found",
                message: { product_id: [ "Product with id #{params[:id]} not found" ] }
            ) if product.nil?

            render json: product, serializer: ProductSerializer
        end

        private

        def author_params
            params.permit(:name, :bio)
        end
        end
    end
end
