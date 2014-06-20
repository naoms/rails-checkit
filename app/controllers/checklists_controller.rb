
class ChecklistsController < ApplicationController

	def index
		@checklists = Checklist.all
	end


	def new
		@checklist = Checklist.new
	end

	def show
		@checklist = Checklist.find(params[:id]) 
	end

	def mychecklist
	end

	def start
		@checklist = Checklist.find(params[:id]) 
	end

	def create
		@checklist = Checklist.new(checklist_params)

		if @checklist.save
			redirect_to @checklist, alert: "Checklist created"

		else
			render 'new'
		end
	end




	private
	def checklist_params
		params.require(:checklist).permit(:title, :description	)
	end

end
