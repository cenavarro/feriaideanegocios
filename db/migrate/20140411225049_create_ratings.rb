class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :judge
      t.belongs_to :project
      t.integer :phase
      t.float :criteria_1
      t.float :criteria_2
      t.float :criteria_3
      t.float :criteria_4
      t.float :criteria_5
      t.float :criteria_6
      t.float :criteria_7
    end
  end
end

