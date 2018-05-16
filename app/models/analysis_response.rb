class AnalysisResponse < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :analysis_request
  has_many :groups, class_name: "AnalysisResultGroup", dependent: :destroy
  has_many :analysis_results

  after_save :parse_response_data

  def parse_response_data(force=false)
    # start with a clean slate
    groups.destroy_all

    # go through the groups one by one ... if they exist
    response_data.fetch("groups", []).each do |group_data|
      group = groups.create(key: group_data["key"],
                            label: group_data["label"])
      group_data.fetch("results", []).each do |result_data|
        result = AnalysisResult.determine_result_type(result_data.fetch("type"))
        result.create(group: group,
                      result_type: result_data.fetch("type"),
                      result_data: result_data,
                      key: result_data["key"],
                      label: result_data["label"])
      end
    end
  end
end
