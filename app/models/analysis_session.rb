class AnalysisSession < ApplicationRecord
  belongs_to :qa_session
  has_many :analysis_requests, dependent: :destroy

  after_create :create_analysis_requests

  delegate :scan_series, to: :qa_session

  protected

    def create_analysis_requests
      scan_series.each do |series|
        a = analysis_requests.create(scan_series_id: series.id, request_data: {})
        byebug
      end
    end
end
