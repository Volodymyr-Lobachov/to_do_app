class Task < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :status, :project_id
end
