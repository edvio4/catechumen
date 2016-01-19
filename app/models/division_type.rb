class DivisionType < ActiveRecord::Base
  has_many :resources

  before_validation :capitalize_name

  validates :name, presence: true, uniqueness: true, format: { with: /([a-zA-Z])+/, message: "only allows letters" }

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
