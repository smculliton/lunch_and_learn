class AddImageUrlToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :image_url, :string
  end
end
