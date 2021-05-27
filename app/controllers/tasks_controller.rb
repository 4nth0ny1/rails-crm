class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
  
      def index
          @tasks = current_user.tasks
      end 
  
     
      def new
          @task = Task.new
          account = Account.find(params[:account_id])
          @contacts = account.contacts
      end
  
      def show 
      end 
  
      
      def edit 
        @contacts = @task.account.contacts
      end
  
      def create
            @task = current_user.tasks.build(task_params)
              if @task.save
                redirect_to @task, notice: "Task was successfully created." 
              else
                render :new
              end
      end
  
        def update
            if @task.update(task_params)
              redirect_to @task, notice: "Task was successfully updated." 
            else
              render :edit
            end
        end
  
        def destroy
          @task.destroy
          redirect_to tasks_url, notice: "Task was successfully destroyed." 
        end
  
  
        private
        def set_task
            @task = Task.find(params[:id])
        end
    
        def task_params
          params.require(:task).permit(:date, :notes, :account_id, :contact_id, :user_id)
        end
  
  end 