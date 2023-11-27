class Quest < ApplicationRecord
  belongs_to :owner, class_name: 'Hero', foreign_key: 'owner_id'
  belongs_to :creator, class_name: 'Hero', foreign_key: 'creator_id'
  belongs_to :status, class_name: 'SecondaryStatus', foreign_key: 'status_id'

  validates :name, presence: true
  validates :reward_exp, presence: true
  validates :reward_level, presence: true
end
