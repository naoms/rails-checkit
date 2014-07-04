class AddTemplateVersionToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :template_version, :integer
  end
end
