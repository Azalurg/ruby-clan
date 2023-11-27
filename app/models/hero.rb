class Hero < ApplicationRecord
  belongs_to :race
  belongs_to :class_name
  belongs_to :background
  has_one :user

  before_save :level_up

  def get_exp_limit
    if self.level <= 70
      2 * self.level * (self.level - 1)
    elsif self.level <= 150
      5 * self.level * (self.level - 1) - 350 * self.level + 9941
    elsif self.level <= 300
      9 * self.level * (self.level - 1) - 950 * self.level + 9940
    elsif self.level > 300
      13 * self.level * (self.level - 1) - 2150 * self.level + 9935
    end
  end

  def level_up
    while self.exp >= self.get_exp_limit
      self.exp -= self.get_exp_limit
      self.level += 1
      self.free_points += 5 if self.level % 10 == 0
      self.free_points += 5 
    end
  
  end

  def self.median(column)
    values = pluck(column).sort
    len = values.length
    (values[(len - 1) / 2] + values[len / 2]) / 2.0
  end

  def self.dominant(column)
    rounded_values = pluck(column).map { |value| (value / 10.0).round * 10 }
    counts = Hash.new(0)
    rounded_values.each { |value| counts[value] += 1 }
    dominant_values = counts.select { |_value, count| count == counts.values.max }.keys
    dominant_values[0]
    end
end
