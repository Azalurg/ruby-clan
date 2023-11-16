class CreateQuests < ActiveRecord::Migration[7.1]
  def change
    create_table :quests do |t|
      t.string :name
      t.text :description
      t.integer :reward_exp
      t.integer :reward_level
      t.integer :max_level
      t.integer :min_level
      t.string :classes
      t.string :races
      t.string :backgrounds

      t.timestamps
    end
  end
end
