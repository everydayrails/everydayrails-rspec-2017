class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :project, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
