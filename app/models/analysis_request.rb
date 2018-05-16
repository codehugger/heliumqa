class AnalysisRequest < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :analysis_session
  belongs_to :scan_series
  has_one :analysis_response, dependent: :destroy

  def method_missing(method, *args)
    return analysis_response.send(method, *args) if analysis_response.respond_to?(method)
    return analysis_session.send(method, *args) if analysis_session.respond_to?(method)
    return scan_series.send(method, *args) if scan_series.respond_to?(method)
    super
  end

  after_create :set_static_response_data
  after_create :set_initial_status

  def status
    "In progress"
  end

  def report_date
    qa_session.performed_at
  end

  def scan_acquisition_date
    scan_series.scan_acquisition_date
  end

  def performed_by
    "Bjarki"
  end

  # TODO: this bypasses the RabbitMQ workflow and should be removed
  def set_static_response_data
    create_analysis_response(response_data: JSON.parse(File.read(Rails.root.join('public', 'example.json'))))
  end

  def set_initial_status
    update(status: 'in progress')
  end
end
