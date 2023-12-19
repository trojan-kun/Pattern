require_relative 'object'

Alex = Human.new("Алекс")
Anna = Human.new("Аня")

Anna.breathe
Alex.breathe

Alex.extend(PushUps)
Anna.extend(PushUps)
Alex.extend(Swim)
Anna.extend(Paint)

Alex.push_ups
Anna.push_ups
Alex.swim
Anna.paint

puts Anna.class
puts Alex.class