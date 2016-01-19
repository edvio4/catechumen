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

['Sections', 'Units', 'Parts', 'Modules'].each do |name|
  DivisionType.create( name: name )
end
