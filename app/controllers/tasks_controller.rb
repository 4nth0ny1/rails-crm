class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
  
      def index
          @tasks = Task.all
      end 
  
      def new
          @task = Task.new
      end
  
      def show 
      end 
  
      def edit 
      end
  
      def create
    
            @task = current_user.tasks.build(task_params)
        
            respond_to do |format|
              if @task.save
                format.html { redirect_to @task, notice: "Task was successfully created." }
                format.json { render :show, status: :created, location: @task }
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @task.errors, status: :unprocessable_entity }
              end
            end
          
        end
  
        def update
          respond_to do |format|
            if @task.update(task_params)
              format.html { redirect_to @task, notice: "Task was successfully updated." }
              format.json { render :show, status: :ok, location: @task }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @task.errors, status: :unprocessable_entity }
            end
          end
        end
  
        def destroy
          @task.destroy
          respond_to do |format|
            format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
            format.json { head :no_content }
          end
        end
  
  
        private
        # Use callbacks to share common setup or constraints between actions.
        def set_task
            @task = Task.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def task_params
          params.require(:task).permit(:date, :notes, :account_id, :contact_id, user_id)
        end
  
  end 