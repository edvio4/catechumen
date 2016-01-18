class Resource < ActiveRecord::Base
  belongs_to :unit_type

  before_validation :parse_division_units
  after_validation :rejoin_division_units, unless: :errors_empty?

  validates :title, presence: true, uniqueness: true
  validates :units, presence: true, format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" }
  validates :unit_type_id, presence: true
  validates :division_units, format: { with: /[a-zA-Z]|\d+/, message: "Please check your 'units' input. See examples" }, allow_blank: true
  validates :division_type, format: { with: /([a-zA-Z])+/, message: "only allows letters" }, allow_blank: true


  private

  def errors_empty?
    self.errors.empty?
  end


  def parse_division_units
    unless division_units.nil?
      unless division_units.empty?
        division_units_parsed = division_units.split(" ")
        if division_units_parsed.length > 1
          self.division_units = division_units_parsed[0]
          self.division_type = division_units_parsed[1].capitalize
        end
      end
    end
  end

  def rejoin_division_units
    unless division_type.nil?
      unless (division_units.empty? && division_type.empty?)
        division_units_rejoined = division_units + " " + division_type.downcase
        self.division_units = division_units_rejoined
      end
    end
  end
end
