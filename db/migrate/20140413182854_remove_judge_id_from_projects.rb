class RemoveJudgeIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :judge_id, :integer
  end
end

