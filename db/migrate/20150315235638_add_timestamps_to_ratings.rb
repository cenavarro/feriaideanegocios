class AddTimestampsToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :created_at, :date
    add_column :ratings, :updated_at, :date
  end
end
