class AddAnalysisSessionToAnalysisRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :analysis_requests, :analysis_session, foreign_key: true
  end
end
