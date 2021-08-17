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
c1 = Character.create
c2 = Character.create
c3 = Character.create
c4 = Character.create
puts "#{ Character.count } characters."

puts 'Users and characters'

u1.characters << c1 << c2
u2.characters << c3
u3.characters << c4

puts 'Characters and items'

c1.items << i1
c2.items << i2 << i5 << i6
c3.items << i3 << i7
c4.items << i4
