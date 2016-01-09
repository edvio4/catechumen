class Student < ActiveRecord::Base
  before_validation :capitalize_name

  validates :name, presence: true, uniqueness: true

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
