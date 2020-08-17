class ModifyColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :date
    add_column :meetings, :date ,:date
    add_column :chemicals, :user_id, :integer
    add_column :optical_elements, :user_id, :integer
  end

end
