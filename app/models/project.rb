class Project < ActiveRecord::Base

  has_and_belongs_to_many :participants
  belongs_to :category

  has_many :assign_projects
  has_many :judges, through: :assign_projects
  has_many :ratings

  accepts_nested_attributes_for :participants, allow_destroy: true
  validate :must_have_one_participant
  validates_presence_of :name, :motivation, :description, :advantage

  scope :in_phase, ->(phase) { where(phase: phase) }

  private
  def must_have_one_participant
    errors.add(:project, 'debe tener al menos un participante') if participants.empty?
  end

end

