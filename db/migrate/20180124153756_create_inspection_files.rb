class CreateInspectionFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :inspection_files do |t|
      t.belongs_to :inspection, foreign_key: true
      t.belongs_to :scan_protocol, foreign_key: true
      t.belongs_to :scan_series, foreing_key: true
      t.text :key, null: false, unique: true
      t.text :filename, index: true
      t.text :mime_type
      t.text :modality
      t.jsonb :file_data
      t.jsonb :scan_header
      t.datetime :file_metadata_extracted
      t.datetime :scan_header_extracted
      t.datetime :scan_protocol_matched
      t.datetime :preview_generated

      t.timestamps
    end
  end
end
