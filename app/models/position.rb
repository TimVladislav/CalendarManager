class Position < ActiveRecord::Base

  #attr_accessible :task_id, :user_id, :isnew
  validates :task_id, presence: true
  validates :user_id, presence: true

  belongs_to :task
  belongs_to :user
end
