class AddStatusToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :status, :boolean
  end
end
