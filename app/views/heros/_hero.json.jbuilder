json.extract! hero, :id, :name, :race_id, :class_name_id, :background_id, :level, :exp, :free_points, :str, :dex, :int, :con, :created_at, :updated_at
json.url hero_url(hero, format: :json)
