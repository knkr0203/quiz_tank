class AddCategoryIdToCardTmps < ActiveRecord::Migration[5.2]
  def change
    add_column :card_tmps, :category_id, :integer
  end
end