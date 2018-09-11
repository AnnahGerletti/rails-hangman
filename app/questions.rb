
cat.chars.map.all? do |char|
  if ['d', 'o', 'g'].include?(char)
  end
 end
 #returns false

cat.chars.map.all? do |char|
  if ['c', 'a', 't'].include?(char)
  end
 end
 #returns false

cat.chars.map.all? do |char|
  ['c', 'a', 't'].include?(char)
end
#returns true


Game.find(55).guesses.guess.each do |guess|
  puts guess
  # How do I pull out only the guesses made for that game.
end

guesses.pluck 

array = game.guesses.pluck(:letter) 