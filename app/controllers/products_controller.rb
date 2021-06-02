class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]
  
      def index
          @products = Product.all
      end 
  
      def new
          @product = Product.new
      end
  
      def show 
      end 
  
      def edit 
      end
  
      def create
            @product = current_user.products.build(product_params)
              if @product.save
                redirect_to @product, notice: "Product was successfully created." 
              else
                render :new
              end
        end
  
        def update
            if @product.update(product_params)
              redirect_to @product, notice: "Product was successfully updated." 
            else
              render :edit
            end
        end
  
        def destroy
          @product.destroy
          redirect_to products_url, notice: "Product was successfully destroyed." 
        end
  
  
        private
        def set_product
            @product = Product.find(params[:id])
        end
    
        def product_params
          params.require(:product).permit(:name, :description, :price, :image_link, :user_id)
        end
  
  end 