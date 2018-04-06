class CreateScanHeaderTags < ActiveRecord::Migration[5.1]
  def change
    create_table :scan_header_tags do |t|
      t.belongs_to :value_type
      t.belongs_to :mime_type
      t.text :key
      t.text :label

      t.timestamps
    end
    add_index :scan_header_tags, :key
    add_index :scan_header_tags, :label
  end
end
