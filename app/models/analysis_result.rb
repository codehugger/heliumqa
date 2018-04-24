class AnalysisResult < ApplicationRecord
  belongs_to :group, class_name: "AnalysisResultGroup", foreign_key: :analysis_result_group_id

  before_validation :set_type

  def set_type
    self.type ||= self.class.determine_result_type(result_data.fetch("type"))
  end

  def self.determine_result_type(type)
    { chart2d: Chart2dResult,
      file: FileResult,
      numeric: NumericResult,
      pass_fail: PassFailResult,
      table: TableResult,
      text: TextResult,
    }[type.to_sym] || AnalysisResult
  end
end
