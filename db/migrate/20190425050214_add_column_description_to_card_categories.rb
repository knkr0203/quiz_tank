class AddColumnDescriptionToCardCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :card_categories, :description, :text
  end
end