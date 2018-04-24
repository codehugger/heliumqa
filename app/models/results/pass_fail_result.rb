class PassFailResult < AnalysisResult
  def value
    result_data.fetch("passes", "")
  end
end
