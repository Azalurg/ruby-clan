class User < ApplicationRecord
  belongs_to :hero, class_name: 'Hero', foreign_key: 'hero_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
