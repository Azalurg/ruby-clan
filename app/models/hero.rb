class Hero < ApplicationRecord
  belongs_to :race
  belongs_to :class_name
  belongs_to :background
end
