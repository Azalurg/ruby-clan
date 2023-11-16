class CreateBackgrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :backgrounds do |t|
      t.string :name

      t.timestamps
    end
  end
end
