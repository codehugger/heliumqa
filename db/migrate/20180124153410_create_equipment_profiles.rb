class CreateEquipmentProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment_profiles do |t|
      t.belongs_to :site, foreign_key: true
      t.string :name
      t.jsonb :profile_data, null: false, default: {}

      t.timestamps
    end
  end
end
