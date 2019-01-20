class AddPicFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :price, :integer
  end
end
