class AssignProject < ActiveRecord::Base
  belongs_to :judge
  belongs_to :project
end

