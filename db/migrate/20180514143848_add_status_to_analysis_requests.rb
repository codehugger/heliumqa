class AddStatusToAnalysisRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :analysis_requests, :status, :text
  end
end
