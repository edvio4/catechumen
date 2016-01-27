class User < ActiveRecord::Base
  has_many :students
  has_many :resources
  has_many :subjects
  has_many :unit_types
  has_many :division_types
  has_many :subjects
  has_many :curriculums
  has_many :lessons
  has_many :recurrences
  has_many :schedules

  validates :email, :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
