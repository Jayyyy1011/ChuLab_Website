class AddFlagToChemicals < ActiveRecord::Migration[5.0]
  def change
    add_column :chemicals, :flag_at, :datetime
  end
end
