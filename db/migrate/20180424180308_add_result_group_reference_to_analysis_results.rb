class AddResultGroupReferenceToAnalysisResults < ActiveRecord::Migration[5.1]
  def change
    add_reference :analysis_results, :analysis_result_group, foreign_key: true
  end
end
