class AddScanAcquisitionDateToQaSessionFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :qa_session_files, :scan_acquisition_date, :datetime
  end
end
