class Subject < ActiveRecord::Base
  has_many :resources
  has_many :curriculums, through: :resources
  belongs_to :user

  before_validation :capitalize_name

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
