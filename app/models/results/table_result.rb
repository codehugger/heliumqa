class TableResult < AnalysisResult
  def rows
    response_data.fetch("table_rows")
  end

  def columns
    response_data.fetch("table_columns")
  end
end
