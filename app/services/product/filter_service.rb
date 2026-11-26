class Product
    class FilterService
        DEFAULT_PAGE = 1
        DEFAULT_PER_PAGE = 10

        def initialize(params = {})
            @params = params
        end

        def execute
            products = Product.includes(:images, :brand, :colour, :category)
            products = apply_brand_filter(products)
            products = apply_colour_filter(products)
            products = apply_category_filter(products)
            products = apply_size_filter(products)
            products = apply_price_filter(products)
            products = apply_search(products)
            products = apply_sorting(products)


            products = products.page(page).per(per_page)
            meta = {
                current_page: products.current_page,
                total_pages:  products.total_pages,
                total_count:  products.total_count,
                per_page:     products.limit_value
            }

            serialized_products = ActiveModelSerializers::SerializableResource.new(
                products,
                each_serializer: ProductSerializer,
                root: false
            ).as_json

            return serialized_products, meta
        end

        private

        def apply_brand_filter(products)
            return products unless @params[:brand_ids].present?
            
            products.where(product_brands: { id: @params[:brand_ids] })
        end

        def apply_colour_filter(products)
            return products unless @params[:colour_ids].present?
            
            products.where(product_colours: { id: @params[:colour_ids] })
        end

        def apply_category_filter(products)
            return products unless @params[:category_ids].present?
            
            products.where(product_categories: { id: @params[:category_ids] })
        end

        def apply_size_filter(products)
            return products unless @params[:sizes].present?

            products.where(size: @params[:sizes])
        end

        def apply_price_filter(products)
            return products unless @params[:min_price].present? && @params[:max_price].present?

            min = @params[:min_price].to_f
            max = @params[:max_price].to_f

            products.where(price: min..max)
        end

        def apply_search(products)
            return products unless @params[:name].present?

            products.where("products.name LIKE ?", "%#{@params[:name]}%")
        end

        def apply_sorting(products)
            case @params[:sort_by]
            when 'highest_price'
                products.order(price: :desc)
            when 'lowest_price'
                products.order(price: :asc)
            when 'old_products'
                products.order(created_at: :asc)
            else
                products.order(created_at: :desc)
            end
        end

        def page 
            @params[:page] || DEFAULT_PAGE
        end

        def per_page
            @params[:per_page] || DEFAULT_PER_PAGE
        end

    end
end