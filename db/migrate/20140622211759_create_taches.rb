class CreateTaches < ActiveRecord::Migration
  def change
    create_table :taches do |t|
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
