class CreateSecondaryStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :secondary_statuses do |t|
      t.string :name
      t.references :primary_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
