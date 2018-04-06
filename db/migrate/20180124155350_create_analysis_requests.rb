class CreateAnalysisRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_requests do |t|
      t.belongs_to :analysis, foreign_key: true
      t.belongs_to :scan_protocol, foreign_key: true
      t.string :key, unique: true, null: false
      t.jsonb :request_data, default: {}, null: false

      t.timestamps
    end
  end
end
