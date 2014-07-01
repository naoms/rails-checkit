class AddGarantToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :garant, :text
  end
end
