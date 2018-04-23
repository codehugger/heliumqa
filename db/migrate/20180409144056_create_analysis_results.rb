class CreateAnalysisResults < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_results do |t|
      t.belongs_to :analysis_response, foreign_key: true
      t.text :key
      t.text :result_type
      t.text :type
      t.jsonb :result_data
      t.jsonb :file_data

      t.timestamps
    end
    add_index :analysis_results, :key
  end
end
