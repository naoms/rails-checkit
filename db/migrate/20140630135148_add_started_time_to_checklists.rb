class AddStartedTimeToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :timeStarted, :datetime
  end
end
