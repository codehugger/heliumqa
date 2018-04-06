class CreateValueTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :value_types do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
