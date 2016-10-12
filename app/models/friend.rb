class Friend < ActiveRecord::Base

  validates :friend_id, presence: true

  belongs_to :user

end
