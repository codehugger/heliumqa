class AddEquipmentReferenceToScanSeries < ActiveRecord::Migration[5.1]
  def change
    add_reference :scan_series, :equipment, foreign_key: true
  end
end
