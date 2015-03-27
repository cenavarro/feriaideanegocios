class AddMotivatedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :motivated, :string
  end
end
