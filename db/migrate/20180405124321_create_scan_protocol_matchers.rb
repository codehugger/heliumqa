class CreateScanProtocolMatchers < ActiveRecord::Migration[5.1]
  def change
    create_table :scan_protocol_matchers do |t|
      t.belongs_to :scan_protocol, foreign_key: true
      t.belongs_to :scan_header_tag, foreign_key: true
      t.belongs_to :value_type_matcher, foreign_key: true

      t.text :value
      t.text :matcher, null: false, default: ''

      t.timestamps
    end
  end
end
