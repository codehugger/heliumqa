class CreateScanProtocols < ActiveRecord::Migration[5.1]
  def change
    create_table :scan_protocols do |t|
      t.belongs_to :site, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
