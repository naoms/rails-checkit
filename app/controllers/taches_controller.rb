class TachesController < ApplicationController
 
  def create
     @checklist = Checklist.find(params[:checklist_id])
    @tache = @checklist.taches.create(tache_params)
    # @tache = Tache.new(tache_params)
    redirect_to @tache
  end


  def new
    @tache = Tache.new
  end
      
  
  def destroy
    # @checklist = checklist.find(params[:checklist_id])
    # @tache = @checklist.taches.find(params[:id])
    # @tache.destroy
    # redirect_to checklist_path(@checklist)
  end
 
  private
    def tache_params
      params.require(:tache).permit(:description, :status)
    end
end
