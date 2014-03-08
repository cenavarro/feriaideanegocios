class AddColumnPhaseToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :phase, :integer
  end
end
