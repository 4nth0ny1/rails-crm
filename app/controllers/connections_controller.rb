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
            # redirect_to account_path(@connection.account.id)
          else
            redirect_to @connection, notice: "Connection was successfully created."
          end
        else
          render :new
        end
      end

      def update
          if @connection.update(connection_params)
            if connection_params["opportunity_check"]
              current_user.opportunities.create(product: @connection.product, contact: @connection.contact, account: @connection.account)
              redirect_to @connection, notice: "Connection was successfully updated." 
            end
          else
            render :edit
          end
      end

      def destroy
        @connection.destroy
        redirect_to connections_url, notice: "Connection was successfully destroyed." 
      end


      private
      def set_connection
          @connection = Connection.find(params[:id])
      end
  
      def connection_params
        params.require(:connection).permit(:user_id, :contact_id, :product_id, :opportunity_id, :account_id, :notes, :connection_type, :opportunity_check)
      end

end 

