class TasksController < ApplicationController

	def new	
		@tasks = Task.new
	end


  def create

    @checklist = Checklist.find(params[:checklist_id])
    @task = @checklist.tasks.new(task_params)
    if @checklist.save
    redirect_to checklist_path(@checklist)
    else
     redirect_to '/checklists/mytestchecklist'
    end

   #  @checklist = Checklist.new(params[:checklist])
   #  @task = @checklist.tasks.build(params[:task_params])
   #  if @checklist.save
  	# redirect_to checklist_path(@checklist)
   #  else
   #   redirect_to '/checklists/mytestchecklist'
   #  end


  end


 
  private
    def task_params
      params.require(:task).permit(:description, :boolean)
    end

end
