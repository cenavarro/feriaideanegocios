class Rating < ActiveRecord::Base
  belongs_to :judge
  belongs_to :project
  validates_inclusion_of :criteria_1, :criteria_2, :criteria_3, :criteria_4,
    :criteria_5, in: 0..100, message: 'calificacion debe estar entre 0 y 100'
  validates_inclusion_of :phase, in: 1..2, message: 'fase tiene que ser 1 o 2'
  validates_presence_of :judge, :project

  scope :in_phase, ->(phase) { where(phase: phase) }

  scope :current, -> { where('extract(year from created_at) = ?', Date.current.year) }

  def average
    send("average_for_phase_#{phase}")
  end

  private
  def average_for_phase_1
    ((criteria_1 + criteria_2 + criteria_3 + criteria_4 + criteria_5 + criteria_8)/6).round(2) rescue 0
  end

  def average_for_phase_2
    ((criteria_1 + criteria_2 + criteria_3 + criteria_4 + criteria_5 + criteria_6 + criteria_7 + criteria_8)/8).round(2) rescue 0
  end
end

