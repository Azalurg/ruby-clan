json.extract! quest, :id, :name, :description, :reward_exp, :reward_level, :max_level, :min_level, :classes, :races, :backgrounds, :created_at, :updated_at
json.url quest_url(quest, format: :json)
