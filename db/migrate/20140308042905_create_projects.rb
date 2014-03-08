class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :code
      t.string :name
      t.integer :stand
      t.integer :phase
      t.text :motivation
      t.text :description
      t.text :advantage
      t.belongs_to :category
      t.belongs_to :judge
    end

    add_index :projects, :judge_id
  end
end
