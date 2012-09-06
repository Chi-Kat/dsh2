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

puts 'adding admin users'

User.destroy_all

users = [
			{:name => 'Kathy', 		:email => 'kathy.j.li@gmail.com', 			:role => 'Admin', :password => 'kathy', 	:password_confirmation => 'kathy'},
			{:name => 'Adam', 		:email => 'adam.lupu@globalplayground.org', :role => 'Admin', :password => 'adam', 		:password_confirmation => 'adam'},
			{:name => 'Shaan', 		:email => 'shahshaan@gmail.com', 			:role => 'Admin', :password => 'shaan', 	:password_confirmation => 'shaan'},
			{:name => 'Enrique', 	:email => 'enrockq@gmail.com', 				:role => 'Admin', :password => 'enrique', 	:password_confirmation => 'enrique'}
]

users.each do |user|
	User.create name: 					user[:name],
				email: 					user[:email],
				role: 					user[:role],
				password: 				user[:password],
				password_confirmation:  user[:password_confirmation]
				puts "Created User #{user[:name]}"
end

Theme.delete_all

themes = [
          {:name => 'Classroom'},
          {:name => 'Sports'},
          {:name => 'Music'},
          {:name => 'Food'}
         ]
        
themes.each do |theme|     
  Theme.create name: theme[:name]
end

puts 'added themes'

