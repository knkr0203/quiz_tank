class AddCardMastersColumnsToCardTmps < ActiveRecord::Migration[5.2]
  def change
    add_column :card_tmps, :question, :text
    add_column :card_tmps, :answer, :text
  end
end