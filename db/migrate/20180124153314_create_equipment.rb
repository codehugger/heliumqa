class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.belongs_to :site, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
