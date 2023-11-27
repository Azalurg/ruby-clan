class DashboardController < ApplicationController
  def index
    @top_heroes = Hero.order(level: :desc).limit(10)
    @clases = Hero.group(:class_name).order('count_all DESC').count()
    @races = Hero.group(:race).order('count_all DESC').count()
    @backgrounds = Hero.group(:background).order('count_all DESC').count()
  
    @avg_level = Hero.average(:level).to_f.round(2)
    @median_level = Hero.median(:level)
    @dominant_level = Hero.dominant(:level)
    @min_level = Hero.minimum(:level)
    @max_level = Hero.maximum(:level)
    @total_heroes = Hero.count()
end
end
