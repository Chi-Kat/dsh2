# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'adding regions'

Region.destroy_all

regions = [ 
              {:name => 'Honduras'},
              {:name => 'Uganda'},
              {:name => 'Thailand'},
              {:name => 'Vietnam'},
              {:name => 'Cambodia'}
           ]
             
regions.each do |region|     
  Region.create name: region[:name]
end

puts 'adding classrooms'

Classroom.destroy_all

classrooms = [ 
              {:name => 'Meeting Point Kampala', :region_id => Region.find_by_name('Uganda').id},
              {:name => 'Huay Puung Mai', :region_id => Region.find_by_name('Thailand').id},
              {:name => 'Khe Sanh',              :region_id => Region.find_by_name('Vietnam').id},
              {:name => 'Project Cambodia',      :region_id => Region.find_by_name('Cambodia').id},
              {:name => 'Project Honduras',      :region_id => Region.find_by_name('Honduras').id}
             ]
             
classrooms.each do |classroom|     
  Classroom.create name: 		classroom[:name], 
                   region_id: 	classroom[:region_id]
end

User.destroy_all

puts 'adding teachers'

Teacher.destroy_all
number = 0
classrooms.each do |classroom|     
  number = number + 1
  t = Teacher.new
  t.name =                  "#{classroom[:name]} Teacher"
  t.email =                 "teacher#{number}@gmail.com"
  t.password =              "teacher"
  t.password_confirmation = "teacher"
  t.classroom_id =          Classroom.find_by_name(classroom[:name]).id
  t.save
end

puts 'adding admins'

Admin.destroy_all

admins = [
			{:name => 'Kathy', 		:email => 'kathy.j.li@gmail.com', :password => 'kathy', 	:password_confirmation => 'kathy'},
			{:name => 'Adam', 		:email => 'adam.lupu@globalplayground.org', :password => 'adam', 		:password_confirmation => 'adam'},
			{:name => 'Shaan', 		:email => 'shahshaan@gmail.com', :password => 'shaan', 	:password_confirmation => 'shaan'},
			{:name => 'Enrique', 	:email => 'enrockq@gmail.com', :password => 'enrique', 	:password_confirmation => 'enrique'}
]

admins.each do |admin|     
  Admin.create name:    admin[:name], 
               email:   admin[:email],
               password:   admin[:password],
               password_confirmation:   admin[:password_confirmation]
end

puts 'adding themes'

Theme.destroy_all

themes = [
          {:name => 'Classroom'},
          {:name => 'Sports'},
          {:name => 'Music'},
          {:name => 'Food'}
         ]
        
themes.each do |theme|     
  Theme.create name: theme[:name]
end

#  puts 'adding a picture'

# Asset.destroy_all

# a = Asset.new
# a.image = "https://digitalschoolhouse.s3.amazonaws.com/uploads/asset/image/2/h_c2.jpg"
# a.classroom_id = Classroom.find_by_name('Project Honduras').id
# a.theme_id = Theme.find_by_name('Classroom').id
# a.user_id = User.find_by_name('Shaan')
# a.title = "Teaching the class"
# a.description = "The kids listen as they are learning a new topic"
# a.save

# assets = [
#             {:classroom_id => 10, :image => 'https://digitalschoolhouse.s3.amazonaws.com/uploads/asset/image/2/h_c2.jpg'}

#          ]




