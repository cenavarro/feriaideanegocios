class Judge < AdminUser

  has_many :assign_projects
  has_many :projects, through: :assign_projects
  has_many :ratings

  scope :in_phase, ->(phase) { where(phase: phase) }

  def add_projects(ids)
    update(project_ids: ids)
  end

  def admin?
    false
  end

  def unrated_projects
    rated_projects = ratings.where('phase = ?', phase).map(&:project)
    projects.where('projects.phase = ?', phase) - rated_projects
  end

end

