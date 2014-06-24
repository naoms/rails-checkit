class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :status
      t.references :checklist, index: true

      t.timestamps
    end
  end
end
