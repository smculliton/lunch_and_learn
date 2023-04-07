class FavoriteSerializer
  include JSONAPI::Serializer

  attributes :recipe_title, :recipe_link, :country, :image_url, :created_at
end