class TextResult < AnalysisResult
  def value
    result_data.fetch("text_value", "")
  end
end
