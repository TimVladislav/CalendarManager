class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  has_many :newtasks
  has_many :positions
  has_many :tasks, through: :positions
  has_many :friends

  validates :email,
    uniqueness: true
end
