class RepliesController < ApplicationController
    before_action :set_reply, only: %i[ show edit update destroy ]
  
      def index
          @replies = current_user.replies
      end 
  
      def new
          @reply = Reply.new(comment_id: params[:comment_id])
      end
  
      def show 
      end 
  
      def edit 
      end
  
      def create
            @reply = current_user.replies.build(reply_params)
              if @reply.save
                redirect_to @reply, notice: "Reply was successfully created." 
              else
                render :new
              end
        end
  
        def update
            if @reply.update(reply_params)
              redirect_to @reply, notice: "Reply was successfully updated." 
            else
              render :edit
            end
        end
  
        def destroy
          @reply.destroy
          redirect_to replies_url, notice: "Reply was successfully destroyed." 
        end
  
  
        private
        def set_reply
            @reply = Reply.find(params[:id])
        end
    
        def reply_params
          params.require(:reply).permit(:reply, :comment_id, :user_id)
        end
  
  end 