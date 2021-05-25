class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

    def index
        @accounts = Account.all
    end 

    def new
        @account = Account.new
    end

    def show 
    end 

    def edit 
    end

    def create
          @account = current_user.accounts.build(account_params)
            if @account.save
              redirect_to @account, notice: "Account was successfully created."
            else
              render :new, status: :unprocessable_entity
            end
      end

      def update
          if @account.update(account_params)
            redirect_to @account, notice: "Account was successfully updated." 
          else
            render :edit, status: :unprocessable_entity             
          end
      end

      def destroy
        @account.destroy
          redirect_to accounts_url, notice: "Account was successfully destroyed."         
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_account
          @account = Account.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def account_params
        params.require(:account).permit(:company_name, :address, :phone)
      end

end 