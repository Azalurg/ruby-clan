class CreateQuests < ActiveRecord::Migration[7.1]
  def change
    create_table :quests do |t|
      t.string :name, null: false
      t.text :description
      t.integer :reward_exp, null: false
      t.integer :reward_level, null: false
      t.integer :max_level
      t.integer :min_level
      t.references :race, foreign_key: true
      t.references :class_name, foreign_key: true
      t.references :background, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :heros }
      t.references :creator, null: false, foreign_key: { to_table: :heros }


      t.timestamps
    end
  end
end
