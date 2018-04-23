class CreateQaSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :qa_sessions do |t|
      t.belongs_to :account, foreign_key: true
      t.text :key, unique: true, null: false
      t.datetime :performed_at

      t.timestamps
    end
  end
end
