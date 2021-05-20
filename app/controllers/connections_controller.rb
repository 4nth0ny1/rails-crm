class ConnectionsController < ApplicationController
    before_action :set_connection, only: %i[ show edit update destroy ]

    def index
        @connections = Connection.all
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
          respond_to do |format|
            if @connection.save
              format.html { redirect_to @connection, notice: "Connection was successfully created." }
              format.json { render :show, status: :created, location: @connection }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @connection.errors, status: :unprocessable_entity }
            end
          end
        
      end

      def update
        respond_to do |format|
          if @connection.update(connection_params)
            format.html { redirect_to @connection, notice: "Connection was successfully updated." }
            format.json { render :show, status: :ok, location: @connection }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @connection.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @connection.destroy
        respond_to do |format|
          format.html { redirect_to connections_url, notice: "Connection was successfully destroyed." }
          format.json { head :no_content }
        end
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

