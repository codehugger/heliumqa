class AnalysisRequest < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :analysis
  belongs_to :equipment_profile
  has_one :analysis_response, dependent: :destroy
  has_many :analysis_request_files, dependent: :destroy

  delegate :response_data, to: :analysis_response

  after_create :set_static_response_data

  # TODO: this bypasses the RabbitMQ workflow and should be removed
  def set_static_response_data
    create_analysis_response(response_data: {
      "results": [{
        "key": "my_text",
        "type": "text",
        "text_value": "Hello World!"
        },{
          "key": "my_numeric",
          "type": "numeric",
          "numeric_value": 3.1415
          },{
            "key": "my_pass_fail",
            "type": "pass_fail",
            "passes": true,
            "message": "All checks are go!"
            },{
              "key": "my_table",
              "type": "table",
              "table_columns": [
                { "key": "column_a", "context": "metadata" },
                { "key": "column_b" }
                ],
                "table_rows": [
                  [1, 2],
                  [2, 3]
                ]
                },{
                  "key": "my_chart",
                  "type": "chart2d",
                  "chart_type": "line",
                  "series": [{
                    "key": "my_series_key",
                    "data": [[1,2], [2,3], [3,4], [4,5], [5,6]]
                    }]
                    }]
                    })
  end
end
