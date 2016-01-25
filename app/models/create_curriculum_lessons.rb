class CreateCurriculumLessons

  def initialize(curriculum)
    @curriculum = curriculum
    create_curriculum_lessons
  end


  def create_curriculum_lessons
    units = @curriculum.resource.units
    number_of_units = get_number(units)
    division_units = @curriculum.resource.division_units ? @curriculum.resource.division_units : ""
    number_of_divisions = division_units.nil? ? "" : (division_units.empty? ? "" : get_number(division_units))
    create_lessons(units, number_of_units, division_units, number_of_divisions)
  end

  def get_number(units)
    return units.to_i if is_number?(units)
    alphabet = ('a'..'z').to_a
    number = alphabet.index(units.downcase)
    return number+1
  end

  def create_lessons(units, number_of_units, division_units,number_of_divisions)
    alphabet = ('a'..'z').to_a
    unit_flag = is_number?(units) ? "number" : ( /[[:upper:]]/.match(units) ? "upper" : "lower" )
    division_flag = is_number?(division_units) ? "number" : ( /[[:upper:]]/.match(division_units) ? "upper" : "lower" )
    number_of_units.times do |i|
      unit = unit_flag == "number" ? i+1 : ( unit_flag == "upper" ? alphabet[i].upcase : alphabet[i])
      Lesson.create(curriculum: @curriculum, unit: unit) if division_units.empty?
      unless division_units.empty?
        number_of_divisions.times do |j|
          division_unit = division_flag == "number" ? j+1 : ( division_flag == "upper" ? alphabet[j].upcase : alphabet[j] )
          Lesson.create(curriculum: @curriculum, unit: unit, division_unit: division_unit)
        end
      end
    end
  end

  def is_number?(string)
    string =~ /\d+/
  end
end
