class Curriculum < ActiveRecord::Base
  belongs_to :resource
  belongs_to :student

  validates :resource_id, presence: true, uniqueness: { scope: :student_id }, numericality: { only_integer: true}
  validates :student_id, presence:true, numericality: { only_integer: true}

end
