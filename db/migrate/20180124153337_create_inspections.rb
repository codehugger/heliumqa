class CreateInspections < ActiveRecord::Migration[5.1]
  def change
    create_table :inspections do |t|
      t.belongs_to :equipment, foreign_key: true
      t.string :key, unique: true, null: false
      t.datetime :performed_at

      t.timestamps
    end
  end
end
