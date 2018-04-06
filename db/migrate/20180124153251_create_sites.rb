class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.belongs_to :account, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
