class Analysis < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :inspection
  has_many :analysis_requests
  has_many :analysis_responses, through: :analysis_requests

  # Hooks
  after_create :create_analysis_requests

  delegate :equipment, to: :inspection

  private

  def create_analysis_requests
    inspection.inspection_files.grouped_by_protocol.each do |protocol, files|
      request = analysis_requests.find_or_create_by(scan_protocol: protocol)
      request.reload
      files.each do |file|
        request.analysis_request_files.create(inspection_file: file)
      end
    end

    # publish the requests
    # AnalysisRequestPublisher.publish(self) do |request|
    #   request.update(request_data: JSON.parse(AnalysesController.render(template: 'analyses/show.json', assigns: { request: request })))
    #   request.touch(:published_at)
    # end
    # touch(:published_at)
  end
end
