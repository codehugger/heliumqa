class CreateAnalysisRequestFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_request_files do |t|
      t.belongs_to :analysis_request, foreign_key: true
      t.belongs_to :inspection_file, foreign_key: true

      t.timestamps
    end
  end
end
