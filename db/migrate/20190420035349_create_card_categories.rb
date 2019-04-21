class CreateCardCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :card_categories do |t|
      t.string :category
      t.string :create_user
      t.timestamps
    end
  end
end
