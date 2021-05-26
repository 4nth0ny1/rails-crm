class ConnectionsController < ApplicationController
    before_action :set_connection, only: %i[ show edit update destroy ]

    def index
        @connections = current_user.connections.by_date
    end 

    def new
        @connection = Connection.new(account_id: params[:account_id])
    end

    def show 
    end 

    def edit 
    end

    def create
          
          @connection = current_user.connections.build(connection_params)
            if @connection.save
              if @connection.opportunity_check 
                current_user.opportunities.create(product: @connection.product, contact: @connection.contact, account: @connection.account)
                redirect_to @connection.account
              else
                redirect_to @connection, notice: "Connection was successfully created."
              end
            else
              render :new, status: :unprocessable_entity 
            end
        
      end

      def update
          if @connection.update(connection_params)
            redirect_to @connection, notice: "Connection was successfully updated." 
          else
            render :edit, status: :unprocessable_entity 
          end
      end

      def destroy
        @connection.destroy
        redirect_to connections_url, notice: "Connection was successfully destroyed." 
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_connection
          @connection = Connection.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def connection_params
        params.require(:connection).permit(:user_id, :contact_id, :product_id, :opportunity_id, :account_id, :notes, :connection_type, :opportunity_check)
      end

end 

