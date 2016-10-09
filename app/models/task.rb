class Task < ActiveRecord::Base
  has_many :positions
  has_many :users, through: :positions

  validates :title,
    presence: true,
    length: { minimum: 3 }
end
