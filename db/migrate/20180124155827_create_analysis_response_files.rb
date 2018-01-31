class CreateAnalysisResponseFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_response_files do |t|
      t.belongs_to :analysis_response, foreign_key: true
      t.jsonb :file_data

      t.timestamps
    end
  end
end
