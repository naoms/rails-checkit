class Task < ActiveRecord::Base
  belongs_to :checklist

  def self.update_status(taskid, new_status)
  		task = Task.find(taskid)
  		task.status = new_status
  		task.save
  		task.status

    end

end
