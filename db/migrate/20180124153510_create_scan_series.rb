class CreateScanSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :scan_series do |t|
      t.string :uid, null: false
      t.text :number, null: false, default: 'n/a'
      t.text :description, null: false, default: ''

      t.timestamps
    end

    add_index :scan_series, :uid, unique: true
  end
end
