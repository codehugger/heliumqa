class CreateAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :analyses do |t|
      t.belongs_to :inspection, foreign_key: true
      t.string :key, unique: true, null: false

      t.timestamps
    end
  end
end
