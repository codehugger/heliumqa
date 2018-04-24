class CreateAnalysisResultGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :analysis_result_groups do |t|
      t.references :analysis_response, foreign_key: true
      t.text :key
      t.text :label

      t.timestamps
    end
    add_index :analysis_result_groups, :key
  end
end
