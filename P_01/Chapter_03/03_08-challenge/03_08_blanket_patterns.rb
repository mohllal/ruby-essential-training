colors = "RRGGBBYYKK"
colors_array = colors.split('')
lines = 20

lines.times do
  puts colors_array.join

  first = colors_array.shift
  colors_array << first
end