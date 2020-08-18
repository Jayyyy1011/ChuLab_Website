class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :optical_elements, :flag_at, :datetime
  end
end
