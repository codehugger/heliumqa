class CreateAnalysisSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_sessions do |t|
      t.references :qa_session, foreign_key: true

      t.timestamps
    end
  end
end
