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


   # render json: task, status: 201

  end

  def update
    task.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def update_status
    checklistid = params[:checklist_id]
    taskid = params[:task_id]
    status = params[:status]
    print "checklistid: #{checklistid}\n"
    print "taskid: #{taskid}\n"
    print "status: #{status}\n"
    Task.update_status(taskid, status)

    respond_to do |format|
      msg = { :status => Task.update_status(taskid, status) }
      format.json  { render :json => msg } # don't do msg.to_json
    end

  end

 
  private
    def task_params
      params.require(:task).permit(:description, :boolean)
    end

end
