class AddAnalysisOptionsFileToScanProtocols < ActiveRecord::Migration[5.2]
  def change
    add_column :scan_protocols, :analysis_options_file_data, :jsonb
  end
end
