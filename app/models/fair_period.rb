class FairPeriod < ActiveRecord::Base

  def self.can_add_project?
    period, today  = first, Date.today
    (period.started_at < today && today < first.ended_at)
  end
end
