class AddCompletedToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :completed, :boolean
  end
end
