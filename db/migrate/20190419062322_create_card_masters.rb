class CreateCardMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :card_masters do |t|
      t.integer :category_id
      t.text :question
      t.text :answer
      t.timestamps
    end
  end
end
