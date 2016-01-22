# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Lessons', 'Pages', 'Sections', 'Units', 'Modules'].each do |name|
  UnitType.create( name: name )
end

['Lessons', 'Sections', 'Units', 'Parts', 'Modules'].each do |name|
  DivisionType.create( name: name )
end

['Math', 'Grammar', 'Reading', 'Spelling', 'Handwriting'].each do |name|
  Subject.create( name: name )
end

['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].each do |day|
  Occurrence.create( day: day )
end

["1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].each do |pace|
  Pace.create( pace: pace)
end
