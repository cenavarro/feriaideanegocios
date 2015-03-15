class AddTimestampsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :created_at, :date
    add_column :projects, :updated_at, :date
  end
end
