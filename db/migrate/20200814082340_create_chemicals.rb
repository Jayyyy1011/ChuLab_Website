class CreateChemicals < ActiveRecord::Migration[5.0]
  def change
    create_table :chemicals do |t|
      t.string :name
      t.string :formula
      t.string :nickname
      t.string :package
      t.string :company
      t.string :agent
      t.string :storage_place
      t.text :remark
      t.string :remain

      t.timestamps
    end
  end
end
