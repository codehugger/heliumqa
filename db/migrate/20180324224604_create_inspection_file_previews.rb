class CreateInspectionFilePreviews < ActiveRecord::Migration[5.1]
  def change
    create_table :inspection_file_previews do |t|
      t.belongs_to :inspection_file, foreign_key: true
      t.jsonb :file_data

      t.timestamps
    end
  end
end
