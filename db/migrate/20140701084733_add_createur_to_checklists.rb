class AddCreateurToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :createur, :string
  end
end
