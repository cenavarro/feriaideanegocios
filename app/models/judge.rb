class Judge < AdminUser

  #validates_uniqueness_of :username

  has_many :projects

  scope :in_phase, ->(phase) { where(phase: phase) }

  def add_projects(ids)
    update(project_ids: ids)
  end

  #private
  #def email_required?
    #false
  #end
end

