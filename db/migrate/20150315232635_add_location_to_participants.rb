class AddLocationToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :location, :string
  end
end
