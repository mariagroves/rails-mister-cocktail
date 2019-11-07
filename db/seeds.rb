require 'open-uri'
require 'json'

Ingredient.destroy_all

puts "Getting array of ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
full_json = JSON.parse(open(url).read)
ingredients_json = full_json["drinks"]

puts "Generating ingredients"

ingredients_json.each do |ingredient|
  Ingredient.create!(
    name: ingredient["strIngredient1"]
    )
end

puts "Finished!"
