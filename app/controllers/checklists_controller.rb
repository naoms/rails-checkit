
class ChecklistsController < ApplicationController

	def index
		@checklists = Checklist.all.order("checklists.updated_at desc")

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
		case @checklist.progess
	    when 0
			render 'show_unstarted.html.erb'
		when 1
			render 'show_started.html.erb'
		else
			render 'show.html.erb'
		end
	end

	def mychecklist
	end

	def start
		@checklist = Checklist.find(params[:checklist_id])
		# @checklist.timeStarted = DateTime.now.to_formatted_s(:long_ordinal)
		# @checklist.timeStarted
		# @checklist.save
		@checklist.progess = '0' 
		@checklist.save
		@progress = @checklist.progess.to_i
		
		@checklist_copie= @checklist.clone
		@checklist_copie.timeStarted = DateTime.now.to_formatted_s(:long_ordinal)
		@checklist_copie.timeStarted
		@checklist_copie.progess = '1' 
		@checklist_copie.save
		@progress_copie = @checklist_copie.progess.to_i

		redirect_to checklist_path(@checklist)
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

	def update
		@checklist = Checklist.find(params[:id])
		if @checklist.update(checklist_params)
			@checklist.save
			redirect_to checklist_start_path(@checklist)
		else
			render 'edit'
		end
	end


    def finish
    	#TODO: Implement method and update button label
    	@checklist = Checklist.find(params[:checklist_id])
    	@checklist.timeFinished = DateTime.now.to_formatted_s(:long_ordinal) 
    	@checklist.save
    	@checklist.progess = '2' 
    	@checklist.save
		@progress = @checklist.progess.to_i
    	redirect_to root_path
    end


	private
	def checklist_params
		params.require(:checklist).permit(:title, :description, :status, :createur)
	end

end
