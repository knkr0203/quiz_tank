class ChangeNameCandidateToChoiceToCardTmps < ActiveRecord::Migration[5.2]
  def change
    rename_column :card_tmps, :candidate1, :choice1
    rename_column :card_tmps, :candidate2, :choice2
    rename_column :card_tmps, :candidate3, :choice3
    rename_column :card_tmps, :candidate4, :choice4
  end
end