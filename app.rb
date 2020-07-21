require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#binding.pry

p1 = Player.new("Anakin")
p2 = Player.new("Obiwan")

puts "#{p1.name} et #{p2.name} vont se battre pour l'avenir de la galaxy ! \n"
puts " - #{p1.name}, je ne te laisserais pas faire !"
puts " - #{p2.name}, si tu n'es pas avec moi, tu es contre moi ! \n\n"

while p1.life_points > 0 && p2.life_points
  puts "Voici l'état des joueurs : "
  puts p1.show_state, p2.show_state
  puts "Passons à la phase d'attaque :"
  p1.attack(p2)
  if p1.life_points < 1 || p2.life_points < 1
    break
  end
  p2.attack(p1)
end
