# frozen_string_literal: true

backgrounds = File.readlines('./db/data/backgrounds.txt').map(&:chomp)
classes = File.readlines('./db/data/classes.txt').map(&:chomp)
names = File.readlines('./db/data/names.txt').map(&:chomp)
races = File.readlines('./db/data/races.txt').map(&:chomp)

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

Hero.all.each do |hero|
  User.create(
    email: Faker::Internet.email,
    password: 'password',
    hero: hero
  )
end
