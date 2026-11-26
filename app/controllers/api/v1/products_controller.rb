module Api
    module V1
        class ProductsController < ApplicationController

            def index
                products, meta = Product::FilterService.new(filter_params).execute()

                render json: {
                    data: products,
                    meta: meta
                }
            end

            def show
                product = Product.find_by(id: params[:id])

                raise CustomError.new(
                    status: :not_found,
                    error: "Not Found",
                    message: { product_id: [ "Product with id #{params[:id]} not found" ] }
                ) if product.nil?

                product = ProductSerializer.new(product, root: false).as_json
                render json: { data: product }
            end

            private

            def filter_params
                params.permit(
                    :name,
                    :brand_id,
                    :colour_id,
                    :category_id,
                    :size,
                    :sort_by,
                    :min_price,
                    :max_price,
                    :page,
                    :per_page
                )
            end
        end
    end
end
