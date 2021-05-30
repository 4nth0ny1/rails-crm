class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

    def index
        @accounts = current_user.accounts
    end 

    def new
        @account = Account.new
    end

    def show 
      if @account.user != current_user
        redirect_to accounts_path
      end 
    end 

    def edit 
    end

    def create
          @account = current_user.accounts.build(account_params)
            if @account.save
              redirect_to @account, notice: "Account was successfully created."
              # redirect_to account_path(@account.id)
            else
              render :new
            end
      end

      def update
          if @account.update(account_params)
            redirect_to @account, notice: "Account was successfully updated." 
          else
            render :edit        
          end
      end

      def destroy
        @account.destroy
          redirect_to accounts_url, notice: "Account was successfully destroyed."         
      end


      private
      def set_account
          @account = Account.find(params[:id])
      end
  
      def account_params
        params.require(:account).permit(:company_name, :address, :phone)
      end

end 
