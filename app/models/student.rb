class Student < ActiveRecord::Base
  has_many :curriculums
  has_many :resources, through: :curriculums
  has_many :subjects, through: :resources
  has_many :lessons, through: :curriculums
  belongs_to :user

  before_validation :capitalize_name

  validates :name, presence: true, uniqueness: { scope: :user_id}
  validates :user_id, presence: true

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
