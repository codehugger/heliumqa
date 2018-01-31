class CreateInspectionFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :inspection_files do |t|
      t.belongs_to :inspection, foreign_key: true
      t.belongs_to :equipment_profile, foreign_key: true
      t.jsonb :file_data
      t.jsonb :profile_header
      t.datetime :profiled_at
      t.datetime :probed_at

      t.timestamps
    end
  end
end
