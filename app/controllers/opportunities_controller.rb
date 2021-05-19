class OpportunitiesController < ApplicationController
    before_action :set_opportunity, only: %i[ show edit update destroy ]

    def index
        @opportunities = Opportunity.all
    end 

    def new
        @opportunity = Opportunity.new(account_id: params[:account_id])
    end

    def show 
    end 

    def edit 
    end

    def create
  
          @opportunity = current_user.opportunities.build(opportunity_params)
      
          respond_to do |format|
            if @opportunity.save
              format.html { redirect_to @opportunity, notice: "Opportunity was successfully created." }
              format.json { render :show, status: :created, location: @opportunity }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @opportunity.errors, status: :unprocessable_entity }
            end
          end
        
      end

      def update
        respond_to do |format|
          if @opportunity.update(opportunity_params)
            format.html { redirect_to @opportunity, notice: "Opportunity was successfully updated." }
            format.json { render :show, status: :ok, location: @opportunity }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @opportunity.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @opportunity.destroy
        respond_to do |format|
          format.html { redirect_to opportunities_url, notice: "Opportunity was successfully destroyed." }
          format.json { head :no_content }
        end
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_opportunity
          @opportunity = Opportunity.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def opportunity_params
        params.require(:opportunity).permit(:account_id, :product_id, :contact_id, :user_id)
      end
end 