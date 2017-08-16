# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Reset the 'users' table
User.delete_all
sam = User.create name: 'Sam Kim', email: 'sam@example.com', password: 'kim'
ben = User.create name: 'Ben Lu', email: 'ben@example.com', password: 'lu'
eliott = User.create name: 'Eliott Joo', email: 'eliott@example.com', password: 'joo'

# Reset the 'cards' table
Card.delete_all
card_data = JSON.parse(open('db/cards.json').read)
card_data.each do |data|
	if data['type'] != 'HERO' #exclude hero cards
	 	c = Card.create name: data['name'],
	 					id: data['id'],
	 					text: data['text'],
	 					flavor: data['flavor'],
	 					artist: data['artist'],
	 					attack: data['attack'],
	 					cardClass: data['cardClass'],
	 					cost: data['cost'],
	 					faction: data['faction'],
	 					health: data['health'],
	 					multiClassGroup: data['multiClassGroup'],
	 					race: data['race'],
	 					rarity: data['rarity'],
	 					set: data['set'],
	 					cardType: data['type'],
	 					mechanics: data['mechanics']
	end
end

# Reset the 'Filters' table
Filter.delete_all

puts "#{User.count} users."
puts "#{Card.count} cards."
puts "#{Filter.count} filters."