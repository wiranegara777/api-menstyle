module Api
    module V1
        module Products
            class BrandsController < ApplicationController

                def index
                    brands = Product::Brand.all

                    render json: brands, each_serializer: Product::BrandSerializer
                end

            end
        end
    end
end
