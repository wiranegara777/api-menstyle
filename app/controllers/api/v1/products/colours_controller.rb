module Api
    module V1
        module Products
            class ColoursController < ApplicationController

                def index
                    colours = Product::Colour.all

                    render json: colours, each_serializer: Product::ColourSerializer
                end
                
            end
        end
    end
end
