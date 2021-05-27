class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show edit update destroy ]

    def index
      if params[:account_id]
        account = Account.find(params[:account_id])
        @contacts = current_user.contacts.where(account: account)
      else
        @contacts = current_user.contacts
      end 
    end 

    def new
        @contact = Contact.new(account_id: params[:account_id])
    end

    def show 
      
    end 

    def edit 
    
    end

    def create
          @contact = current_user.contacts.build(contact_params)
            if @contact.save
              redirect_to @contact, notice: "Contact was successfully created." 
            else
              render :new
            end
      end

      def update
          if @contact.update(contact_params)
            redirect_to @contact, notice: "Contact was successfully updated." 
          else
            render :edit
          end
      end

      def destroy
        @contact.destroy
        redirect_to contacts_url, notice: "Contact was successfully destroyed." 
      end


      private
      def set_contact
          @contact = Contact.find(params[:id])
      end
  
      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :phone, :email, :role, :account_id, :connection_id, :user_id)
      end
end 