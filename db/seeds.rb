# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
4.times do |list|
    List.create(name: ['Life Long Dream', 'End of Life Goal', 'Dying Wish', 'Childhood Dream'].sample,
      description: ['A Dream I Had Since I Was a Child', 'When I Was 13...', 'Bucket List', 'Saw It In A Movie'].sample)
end


50.times do |index|
    List.create(name: "animal #{index}",
      description: "This is the description")
end
