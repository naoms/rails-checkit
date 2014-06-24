class AddProgressToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :progess, :integer
  end
end
