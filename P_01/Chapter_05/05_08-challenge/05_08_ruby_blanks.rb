puts "-" * 15
puts "| Ruby Blanks |"
puts "-" * 15

BLANKS = ['verb', 'adjective', 'adjective', 'noun']
VOWELS = ['a', 'e', 'i', 'o', 'u']

answers = BLANKS.map do |request|
  article = VOWELS.include?(request[0]) ? 'an' : 'a'
  puts "Give me #{article} #{request}: "

  response = gets.chomp
  response
end

text = "I decided to #{answers[0]} a #{answers[1]} party for my #{answers[2]} #{answers[3]}."

puts text