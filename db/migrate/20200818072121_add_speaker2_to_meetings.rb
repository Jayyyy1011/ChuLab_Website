class AddSpeaker2ToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :speaker2, :string
  end
end
