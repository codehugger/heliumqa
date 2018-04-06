class CreateValueTypeMatchers < ActiveRecord::Migration[5.1]
  def change
    create_table :value_type_matchers do |t|
      t.belongs_to :value_type, foreign_key: true
      t.text :label
      t.text :matcher

      t.timestamps
    end
  end
end
