class CreateHeros < ActiveRecord::Migration[7.1]
  def change
    create_table :heros do |t|
      t.string :name, null: false
      t.references :race, null: false, foreign_key: true
      t.references :class_name, null: false, foreign_key: true
      t.references :background, null: false, foreign_key: true
      t.integer :level, null: false
      t.integer :exp
      t.integer :free_points
      t.integer :str
      t.integer :dex
      t.integer :int
      t.integer :con

      t.timestamps
    end

    add_index :heros, :name, unique: true
  end
end
