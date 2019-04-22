class AddCandidatesToCardMasters < ActiveRecord::Migration[5.2]
  def change
    add_column :card_masters, :candidate1, :text
    add_column :card_masters, :candidate2, :text
    add_column :card_masters, :candidate3, :text
    add_column :card_masters, :candidate4, :text
  end
end