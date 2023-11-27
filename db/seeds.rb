# frozen_string_literal: true

backgrounds = File.readlines('./db/data/backgrounds.txt').map(&:chomp)
classes = File.readlines('./db/data/classes.txt').map(&:chomp)
names = File.readlines('./db/data/names.txt').map(&:chomp)
races = File.readlines('./db/data/races.txt').map(&:chomp)
quests = File.readlines('./db/data/quests.txt').map(&:chomp)

backgrounds.each do |b_name|
  Background.create(
    name: b_name
  )
end

classes.each do |c_name|
  ClassName.create(
    name: c_name
  )
end

races.each do |r_name|
  Race.create(
    name: r_name
  )
end

puts 'Start adding heroes'

names.each do |name|
  hero = Hero.new(
    name: name,
    race: Race.all.sample,
    class_name: ClassName.all.sample,
    background: Background.all.sample,
    level: (rand(0..50) * 2 + rand(0..50) * 2 + rand(0..50) * 2 + rand(0..50) * 2 - 50).abs + 1,
    exp: 0,
    free_points: 0,
    str: 0,
    dex: 0,
    int: 0,
    con: 0
  )

  hero.free_points = hero.level * 5 + (hero.level % 10) * 5
  hero.exp = (hero.get_exp_limit * rand(0..0.9)).to_i
  hero.asign_points

  hero.save
end

puts 'Start adding users - takes a while; off for now'

# Hero.all.each do |hero|
#   User.create(
#     email: Faker::Internet.email,
#     password: 'password',
#     hero: hero
#   )
# end

# TODO check if admin exists

User.create(
  email: 'admin@example.com',
  password: 'admin123',
  hero: Hero.create(
    name: 'Admin',
    race_id: 1,
    class_name_id: 1,
    background_id: 1,
    level: 1,
    exp: 0,
    free_points: 0,
    str: 0,
    dex: 0,
    int: 0,
    con: 0
  )
)

puts 'Admin created'

PrimaryStatus.create(
  name: 'Not Started',
  secondary_status: [
    SecondaryStatus.create(name: 'Accepted'),
    SecondaryStatus.create(name: 'Unassigned')
  ]
)

PrimaryStatus.create(
  name: 'In Progress',
  secondary_status: [
    SecondaryStatus.create(name: 'Collecting Materials'),
    SecondaryStatus.create(name: 'Talking to NPC'),
    SecondaryStatus.create(name: 'Exploring Dungeon'),
    SecondaryStatus.create(name: 'Fighting Boss')
  ]
)

PrimaryStatus.create(
  name: 'On Hold',
  secondary_status: [
    SecondaryStatus.create(name: 'Waiting for Event'),
    SecondaryStatus.create(name: 'Waiting for Other Players')
  ]
)

PrimaryStatus.create(
  name: 'Completed',
  secondary_status: [
    SecondaryStatus.create(name: 'Success'),
    SecondaryStatus.create(name: 'Abandoned'),
    SecondaryStatus.create(name: 'Partial Success'),
    SecondaryStatus.create(name: 'Failure')
  ]
)

puts 'Start adding quests'

quests.each do |quest|
  rng = rand(0..12)

  Quest.create(
    name: quest,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    reward_exp: rng < 10 ? rand(0..100_000) : 0,
    reward_level: rng >= 10 ? rng % 4 + 1 : 0,
    max_level: (rng % 3).zero? ? 200 : 500,
    min_level: rng.even? ? 100 : 0,
    owner: Hero.all.sample,
    creator: Hero.all.sample,
    status: SecondaryStatus.all.sample
  )
end
