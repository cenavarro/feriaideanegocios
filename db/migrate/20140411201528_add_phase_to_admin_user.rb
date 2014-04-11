class AddPhaseToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :phase, :integer
  end
end
