class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show edit update destroy ]

    def index
        @contacts = Contact.all
    end 

    def new
        @contact = Contact.new
    end

    def show 
    end 

    def edit 
    end

    def create
  
          @contact = current_user.contacts.build(contact_params)
      
          respond_to do |format|
            if @contact.save
              # params[:contact][:account_ids].each do |id|
              #   AccountsContacts.create(contact: @contact, account_ids: id)
              # end 
              format.html { redirect_to @contact, notice: "Contact was successfully created." }
              format.json { render :show, status: :created, location: @contact }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @contact.errors, status: :unprocessable_entity }
            end
          end
        
      end

      def update
        respond_to do |format|
          if @contact.update(contact_params)
            format.html { redirect_to @contact, notice: "Contact was successfully updated." }
            format.json { render :show, status: :ok, location: @contact }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @contact.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @contact.destroy
        respond_to do |format|
          format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
          format.json { head :no_content }
        end
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        if current_user
          @contact = Contact.find(params[:id])
        end
      end
  
      # Only allow a list of trusted parameters through.
      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :phone, :email, :role)
      end
end 