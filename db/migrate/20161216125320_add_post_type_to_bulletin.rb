class AddPostTypeToBulletin < ActiveRecord::Migration[5.0]
  def change
    add_column :bulletins, :post_type, :string
  end
end
