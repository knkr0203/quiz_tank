class AddCardMastersColumnsToCardTmps < ActiveRecord::Migration[5.2]
  def change
    add_column :card_tmps, :question, :text
    add_column :card_tmps, :answer, :text
    add_column :card_tmps, :candidate1, :text
    add_column :card_tmps, :candidate2, :text
    add_column :card_tmps, :candidate3, :text
    add_column :card_tmps, :candidate4, :text
  end
end