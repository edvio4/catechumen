class DivisionType < ActiveRecord::Base
  has_many :resources
  belongs_to :user

  before_validation :capitalize_name

  validates :name, presence: true, uniqueness: { scope: :user_id}, format: { with: /([a-zA-Z])+/, message: "only allows letters" }
  validates :user_id, presence: true

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
