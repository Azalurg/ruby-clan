class DashboardController < ApplicationController
  def index
    @top_heroes = Hero.order(level: :desc).limit(10)
    @clases = Hero.group(:class_name).order('count_all DESC').count()
    @races = Hero.group(:race).order('count_all DESC').count()
    @backgrounds = Hero.group(:background).order('count_all DESC').count()
  end
end
