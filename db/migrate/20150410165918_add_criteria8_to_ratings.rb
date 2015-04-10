class AddCriteria8ToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :criteria_8, :float
  end
end
