class CreateQaSessionFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :qa_session_files do |t|
      t.belongs_to :qa_session, foreign_key: true
      t.belongs_to :scan_protocol, foreign_key: true
      t.belongs_to :scan_series, foreing_key: true
      t.text :key, null: false, unique: true
      t.text :filename, index: true
      t.text :mime_type
      t.text :modality
      t.jsonb :file_data
      t.jsonb :scan_header
      t.datetime :scan_attributes_extracted
      t.datetime :scan_header_extracted
      t.datetime :scan_protocol_matched
      t.datetime :preview_generated

      t.timestamps
    end
  end
end
