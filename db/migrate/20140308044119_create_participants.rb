class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :carnet
      t.string :name
      t.string :phone
      t.string :email
      t.belongs_to :career
    end

    add_index :participants, :carnet, unique: true
  end
end
