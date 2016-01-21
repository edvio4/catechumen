class Subject < ActiveRecord::Base
  has_many :resources
  has_many :curriculums, through: :resources

  before_validation :capitalize_name

  validates :name, presence: true, uniqueness: true

  private

  def capitalize_name
    self.name = name.capitalize
  end
end