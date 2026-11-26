module Api
    module V1
        module Products
            class CategoriesController < ApplicationController

                def index
                    categories = Product::Category.all

                    render json: categories, each_serializer: Product::CategorySerializer
                end
                
            end
        end
    end
end
