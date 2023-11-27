class Hero < ApplicationRecord
  belongs_to :race
  belongs_to :class_name
  belongs_to :background
  has_one :user

  before_save :level_up

  def get_exp_limit
    if level <= 70
      2 * level * (level - 1) + 10
    elsif level <= 150
      5 * level * (level - 1) - 350 * level + 9951
    elsif level <= 300
      9 * level * (level - 1) - 950 * level + 9950
    elsif level > 300
      13 * level * (level - 1) - 2150 * level + 9945
    end
  end

  def level_up
    while exp >= get_exp_limit
      self.exp -= get_exp_limit
      self.level += 1
      self.free_points += 5 if (self.level % 10).zero?
      self.free_points += 5
    end
  end

  def asign_points
    while self.free_points.positive?
      case rand(0..3)
      when 0
        self.str += 1
      when 1
        self.dex += 1
      when 2
        self.int += 1
      else
        self.con += 1
      end
      self.free_points -= 1
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
