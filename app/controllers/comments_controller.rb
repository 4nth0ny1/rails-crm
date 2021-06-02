class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
  
      def index
          @comments = current_user.comments
      end 
  
      def new
          @comment = Comment.new(product_id: params[:product_id])
      end
  
      def show 
      end 
  
      def edit 
      end
  
      def create
            @comment = current_user.comments.build(comment_params)
              if @comment.save
                redirect_to @comment.product, notice: "Comment was successfully created." 
              else
                render :new
              end
        end
  
        def update
            if @comment.update(comment_params)
              redirect_to @comment, notice: "Comment was successfully updated." 
            else
              render :edit
            end
        end
  
        def destroy
          @comment.destroy
          redirect_to comments_url, notice: "Comment was successfully destroyed." 
        end
  
  
        private
        def set_comment
            @comment = Comment.find(params[:id])
        end
    
        def comment_params
          params.require(:comment).permit(:title, :description, :product_id, :user_id)
        end
  
  end 