class NumericResult < AnalysisResult
  def value
    result_data.fetch("numeric_value", "")
  end
end
