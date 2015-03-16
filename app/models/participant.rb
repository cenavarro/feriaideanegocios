class Participant < ActiveRecord::Base
  LOCATIONS = %w(Cartago Centro\ Academico Alajuela San\ Carlos Limon)
  has_and_belongs_to_many :projects
  belongs_to :career
  validates_uniqueness_of :carnet
  validates_presence_of :carnet, :name, :email
  validates_format_of :email, with: /\A[^@]+@[^@]+\z/
end

