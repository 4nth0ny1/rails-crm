class OpportunitiesController < ApplicationController
    before_action :set_opportunity, only: %i[ show edit update destroy ]

    def index
        @opportunities = current_user.opportunities
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
            if @opportunity.save
              redirect_to @opportunity, notice: "Opportunity was successfully created." 
            else
              render :new, status: :unprocessable_entity 
            end
      end

      def update
          if @opportunity.update(opportunity_params)
            redirect_to @opportunity, notice: "Opportunity was successfully updated." 
          else
            render :edit, status: :unprocessable_entity 
          end
      end

      def destroy
        @opportunity.destroy
        redirect_to opportunities_url, notice: "Opportunity was successfully destroyed." 
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