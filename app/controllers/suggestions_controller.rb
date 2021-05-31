class SuggestionsController < ApplicationController
    before_action :set_suggestion, only: %i[ show edit update destroy ]
  
      def index
          @suggestions = Suggestion.all
      end 
  
      def new
          @suggestion = Suggestion.new
      end
  
      def show 
      end 
  
      def edit 
      end
  
      def create
            @suggestion = current_user.suggestions.build(suggestion_params)
              if @suggestion.save
                redirect_to @suggestion, notice: "Suggestion was successfully created." 
              else
                render :new
              end
        end
  
        def update
            if @suggestion.update(suggestion_params)
              redirect_to @suggestion, notice: "
              Suggestion was successfully updated." 
            else
              render :edit
            end
        end
  
        def destroy
          @suggestion.destroy
          redirect_to suggestions_url, notice: "Suggestion was successfully destroyed." 
        end
  
  
        private
        def set_suggestion
            @suggestion = Suggestion.find(params[:id])
        end
    
        def suggestion_params
          params.require(:suggestion).permit(:title, :description, :user_id)
        end
  
  end 