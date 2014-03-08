class CreateParticipantsProjects < ActiveRecord::Migration
  def change
    create_table :participants_projects do |t|
      t.belongs_to :project
      t.belongs_to :participant
    end
  end
end
