class Judge < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username

  has_many :projects

  scope :in_phase, ->(phase) { where(phase: phase) }

  def add_projects(ids)
    update(project_ids: ids)
  end

  private
  def email_required?
    false
  end
end

