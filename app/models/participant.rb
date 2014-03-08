class Participant < ActiveRecord::Base
  has_and_belongs_to_many :projects
  belongs_to :career
end
