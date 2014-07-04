
class ChecklistsController < ApplicationController

	def index
		@checklists = Checklist.all.order('checklists."timeStarted" desc','checklists.created_at asc')

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

	def en_cours
	@checklists = Checklist.all.order('checklists."timeStarted" desc','checklists.created_at asc')
	end


	def terminees
	@checklists = Checklist.all.order('checklists."timeStarted" desc','checklists.created_at asc')
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
		@checklist = Checklist.find(params[:checklist_id])
	end

	def start
		@checklist = Checklist.find(params[:checklist_id])
		# @checklist.timeStarted = DateTime.now.to_formatted_s(:long_ordinal)
		# @checklist.timeStarted
		# @checklist.save
		# @checklist.progess = '1' 
		# @checklist.save
		# @progress = @checklist.progess.to_i
        

		print '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Version :' 
		print @checklist.template_version

		# smell strange with garant
		@checklist_copie = Checklist.create_instance(@checklist, @checklist.garant)
		@checklist_copie.save  	


#		@checklist_copie = @checklist.clone

#		@checklist_copie.id = nil
#		@checklist_copie.timeStarted = DateTime.now.to_formatted_s(:long_ordinal)
#		@checklist_copie.timeStarted
#		@checklist_copie.progess = '1' 
#		@checklist_copie.save
#		@progress_copie = @checklist_copie.progess.to_i

		 redirect_to checklist_path(@checklist_copie)

		# redirect_to checklist_path(@checklist)
	end

	def create
		@checklist = Checklist.new(checklist_params)


		if @checklist.save
			@checklist.progess = '0'
			#verifier quae ca amrhce ! 
			@checklist.template_version = 2
			@checklist.save
			@progress = @checklist.progess.to_i		
			redirect_to checklist_path(@checklist)

		else
			render 'new'
		end
	end

	def update
		@checklist = Checklist.find(params[:id])
		print checklist_params;
		if @checklist.update(checklist_params)
			@checklist.save
			redirect_to checklist_start_path(@checklist)
		else
			render 'edit'
		end
	end


	def destroy
		@checklist = Checklist.find(params[:id])
		@checklist.destroy
	
		redirect_to checklists_path
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
		params.require(:checklist).permit(:title, :description, :status, :createur, :garant)
	end

end
