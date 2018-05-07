class CreatePhantomModuleFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :phantom_module_files do |t|
      t.references :scan_protocol, foreign_key: true
      t.text :filename
      t.jsonb :file_data

      t.timestamps
    end
  end
end
