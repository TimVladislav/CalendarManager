class Task < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 3 }

  has_many :positions
  has_many :users, through: :positions

end
