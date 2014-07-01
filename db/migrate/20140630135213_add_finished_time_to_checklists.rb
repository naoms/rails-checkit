class AddFinishedTimeToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :timeFinished, :datetime
  end
end
