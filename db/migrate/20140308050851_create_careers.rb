class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :name
    end
  end
end
