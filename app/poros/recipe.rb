class Recipe
  attr_reader :title, :url, :country, :image

  def initialize(data, country)
    @title = data[:label]
    @url = data[:url]
    @country = country
    @image = data[:image]
  end
end