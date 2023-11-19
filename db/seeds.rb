backgrounds = File.readlines('./db/data/backgrounds.txt').map(&:chomp)
classes = File.readlines('./db/data/classes.txt').map(&:chomp)
names = File.readlines('./db/data/names.txt').map(&:chomp)
races = File.readlines('./db/data/races.txt').map(&:chomp)

backgrounds.each do |b_name| 
    background = Background.create(
        name: b_name
    )
end

classes.each do |c_name| 
    class_name = ClassName.create(
        name: c_name
    )
end

races.each do |r_name| 
    race = Race.create(
        name: r_name
    )
end



names.each do |name|
  hero = Hero.new(
    name: name,
    race: Race.all.sample,
    class_name: ClassName.all.sample,
    background: Background.all.sample,
    level: rand(0..50) * 2 + rand(0..50) * 2 + rand(1..150),
    exp: 0,
    free_points: 0,
    str: 0,
    dex: 0,
    int: 0,
    con: 0
  )

  hero.free_points = hero.level * 5 + (hero.level % 10) * 5
  while hero.free_points > 0
    case rand(0..3)
    when 0
        hero.str = hero.str + 1
    when 1
        hero.dex+=1
    when 2
        hero.int+=1
    else
        hero.con += 1
    end
    hero.free_points -= 1
  end

  hero.save
end
