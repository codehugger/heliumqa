class CreateQaSessionFilePreviews < ActiveRecord::Migration[5.1]
  def change
    create_table :qa_session_file_previews do |t|
      t.belongs_to :qa_session_file, foreign_key: true
      t.jsonb :file_data

      t.timestamps
    end
  end
end
