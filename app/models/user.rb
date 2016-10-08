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

  has_and_belongs_to_many :tasks

  validates :email,
    uniqueness: true
end
