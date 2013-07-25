# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#University.delete_all

#University.create(name: 'Национальный горный университет', address: 'пр. Карла Маркса, 19, Днепропетровск')
#University.create(name: 'Химико-технологический университет', address: 'пр. Гагарина, 8, Днепропетровск')
#University.create(name: 'Национальная металлургическая академия', address: 'пр. Гагарина, 4, Днепропетровск')
#University.create(name: 'Академия строительства и архитектуры', address: 'ул. Чернышевского, 24-А, Днепропетровск')
#University.create(name: 'Днепропетровский национальный университет', address: 'пр. Гагарина, 72, Днепропетровск')

Faculty.create(name: 'Факультет информационных технологий', university_id: 1)
Faculty.create(name: 'Электротехнический факультет', university_id: 1)
Faculty.create(name: 'Факультет менеджмента', university_id: 1)
Faculty.create(name: 'Горный факультет', university_id: 1)
Faculty.create(name: 'Юридический факультет', university_id: 1)