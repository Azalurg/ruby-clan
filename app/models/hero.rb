class Hero < ApplicationRecord
  belongs_to :race
  belongs_to :class_name
  belongs_to :background
  has_one :user

  def get_exp_limit
    if level <= 70
      2 * level * (level - 1)
    elsif level <= 150
      5 * level * (level - 1) - 350 * level + 9941
    elsif level > 150
      9 * level * (level - 1) - 950 * level + 9940
    end
  end

  def level_up
    while exp >= get_exp_limit
      exp -= get_exp_limit
      level += 1
      free_points += 5 if level % 10 == 0
      free_points += 5 
    end   
  end
end