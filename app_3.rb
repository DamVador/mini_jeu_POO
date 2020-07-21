require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'MUSTAFAR, le tombeau des jedi' !|
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------
"
#Initialisation des joueurs
puts "Quel est ton prénom ?"
prenom = gets.chomp
game = Game.new(prenom)
tour = 1
while game.is_still_ongoing? == true
  puts "_________________________________------ #{tour} ------_________________________________"
  tour += 1
  game.show_players
  game.menu
  answer = gets.chomp
  game.menu_choice(answer)  
  game.ennemies_attack
end

game.end
