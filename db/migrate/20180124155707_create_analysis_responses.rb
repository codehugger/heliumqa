class CreateAnalysisResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_responses do |t|
      t.belongs_to :analysis_request, foreign_key: true
      t.text :key, unique: true, null: false
      t.jsonb :response_data, default: {}, null: false

      t.timestamps
    end
  end
end
