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
        
            respond_to do |format|
              if @product.save
                format.html { redirect_to @product, notice: "Product was successfully created." }
                format.json { render :show, status: :created, location: @product }
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @product.errors, status: :unprocessable_entity }
              end
            end
          
        end
  
        def update
          respond_to do |format|
            if @product.update(account_params)
              format.html { redirect_to @product, notice: "Product was successfully updated." }
              format.json { render :show, status: :ok, location: @product }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @product.errors, status: :unprocessable_entity }
            end
          end
        end
  
        def destroy
          @product.destroy
          respond_to do |format|
            format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
            format.json { head :no_content }
          end
        end
  
  
        private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
            @product = Product.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def product_params
          params.require(:product).permit(:name, :description, :price)
        end
  
  end 