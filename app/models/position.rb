class Position < ActiveRecord::Base

  #attr_accessible :task_id, :user_id, :isnew

  belongs_to :task
  belongs_to :user
end
