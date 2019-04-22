class CreateCardTmps < ActiveRecord::Migration[5.2]
  def change
    create_table :card_tmps do |t|
      t.string :card_master_id
      t.string :create_user
      t.integer :rank
      t.time :next_time
      t.timestamps
    end
  end
end