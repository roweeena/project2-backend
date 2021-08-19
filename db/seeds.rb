User.destroy_all
u1 = User.create :username => 'Cristhian', :email => 'cd@ga.co', :password => 'chicken',:admin => true
u2 = User.create :username => 'Ro', :email => 'ro@ga.co', :password => 'chicken',:admin => true
u3 = User.create :username => 'Mai', :email => 'mai@ga.co', :password => 'chicken'
puts "#{User.count} users."

Item.destroy_all
i1 = Item.create
i2 = Item.create
i3 = Item.create
i4 = Item.create
i5 = Item.create
i6 = Item.create
i7 = Item.create
puts "#{ Item.count } items."

Character.destroy_all
c1 = Character.create :name => 'Ollie', :catchphrase => "Winner", :job => 'Magician', :items => '1050004', :image => ''
c2 = Character.create :name => 'Razz', :catchphrase => "Yeah!", :job => 'Warrior', :items => '1050005', :image => ''
c3 = Character.create :name => 'Angel'
c4 = Character.create :name => 'Darky'
puts "#{ Character.count } characters."

puts 'Users and characters'

u1.characters << c1
u2.characters << c2
u3.characters << c3

puts 'Characters and items'
