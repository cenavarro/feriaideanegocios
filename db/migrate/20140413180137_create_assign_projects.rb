class CreateAssignProjects < ActiveRecord::Migration
  def change
    create_table :assign_projects do |t|
      t.belongs_to :judge
      t.belongs_to :project
      t.integer :phase
    end
  end
end

