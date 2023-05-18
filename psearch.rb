require 'json'

# Assuming 'foods' is your array of food data
# load it from a file
foods = JSON.parse(File.read('foods.json'))

# Get the search term from the user
puts "Enter the food you are looking for:"
search_term = gets.chomp.downcase

# Search the foods array
matching_foods = foods.select do |food|
  food['Food'].downcase.include?(search_term)
end

# p matching_foods

# Print the matching foods
matching_foods.each do |food|
  purine_amount = food['Purine']
  purine_level = if purine_amount < 100
    'Low'
  elsif purine_amount >= 100 && purine_amount < 400
    'Moderate'
  else
    'High'
  end
  puts "Food: #{food['Food']}, Purine: #{food['Purine']}, Level: #{purine_level}"
end

if matching_foods.empty?
  p 'Food not in the database'
end