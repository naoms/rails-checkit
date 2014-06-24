
class ChecklistsController < ApplicationController

	def index
		@checklists = Checklist.all
	end


	def new
		@checklist = Checklist.new
		@task = Task.new
		# @checklist.tasks.build
  		#@task = @checklist.tasks.new(task_params)
		
	end

	def new_tasks
	    @checklist = Checklist.find(params[:checklist_id]) 
	    5.times { @checklist.tasks.build }	
	    @tasks = Task.all
    end 



	def show
		@checklist = Checklist.find(params[:id]) 
		@tasks = Task.all
	end

	def mychecklist
	end

	def start
		@checklist = Checklist.find(params[:checklist_id])
		@checklist.progess = '1' 
		@checklist.save
		@progress = @checklist.progess.to_i
	end

	def create
		@checklist = Checklist.new(checklist_params)

		

		if @checklist.save
			@checklist.progess = '0'
			@checklist.save
			@progress = @checklist.progess.to_i		
			redirect_to checklist_path(@checklist)

		else
			render 'new'
		end
	end


    def finish
    	#TODO: Implement method and update button label
    	@checklist = Checklist.find(params[:checklist_id]) 
    	@checklist.progess = '2' 
    	@checklist.save
		@progress = @checklist.progess.to_i
    	redirect_to root_path
    end


	private
	def checklist_params
		params.require(:checklist).permit(:title, :description, :status	)
	end

end
