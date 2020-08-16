class Modify < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :date
    add_column :meetings, :date ,:date
  end
end
