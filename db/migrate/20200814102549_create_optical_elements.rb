class CreateOpticalElements < ActiveRecord::Migration[5.0]
  def change
    create_table :optical_elements do |t|
      t.string :item_number
      t.string :name
      t.string :bandwidth
      t.integer :category_id
      t.text :remark

      t.timestamps
    end

    add_index :optical_elements, :category_id
  end
end
