class RenameCandidateColumnToCardMasters < ActiveRecord::Migration[5.2]
  def change
    rename_column :card_masters, :candidate1, :choice1
    rename_column :card_masters, :candidate2, :choice2
    rename_column :card_masters, :candidate3, :choice3
    rename_column :card_masters, :candidate4, :choice4
  end
end