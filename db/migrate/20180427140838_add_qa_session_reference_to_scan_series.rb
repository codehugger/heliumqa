class AddQaSessionReferenceToScanSeries < ActiveRecord::Migration[5.1]
  def change
    add_reference :scan_series, :qa_session, foreign_key: true
  end
end
