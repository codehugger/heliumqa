class AddSpecificationsFileToScanProtocols < ActiveRecord::Migration[5.2]
  def change
    add_column :scan_protocols, :specifications_file_data, :jsonb
  end
end
