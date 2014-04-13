class Rating < ActiveRecord::Base
  belongs_to :judge
  belongs_to :project
  validates_inclusion_of :criteria_1, :criteria_2, :criteria_3, :criteria_4,
    :criteria_5, in: 0..100, message: 'calificacion debe estar entre 0 y 100'
  validates_inclusion_of :phase, in: 1..2, message: 'fase tiene que ser 1 o 2'
  validates_presence_of :judge, :project
end

