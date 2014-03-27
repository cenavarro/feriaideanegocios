class CreateFairPeriod < ActiveRecord::Migration
  def migrate(direction)
    super
    FairPeriod.create(started_at: Time.now, ended_at: Time.now) if direction == :up
  end

  def change
    create_table :fair_periods do |t|
      t.date :started_at
      t.date :ended_at
      t.timestamps
    end
  end
end

