require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'MUSTAFAR, le tombeau des jedi' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------
"
#Initialisation des joueurs
puts "Quel est ton prénom ?"
prenom = gets.chomp
hp = HumanPlayer.new(prenom)
player1 = Player.new("Anakin")
player2 = Player.new("Obiwan")

ennemies = [player1, player2]
#############################
tour = 1
#Combat
while hp.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

    puts "____________________----- #{tour} -----___________________"
    tour += 1
    puts "L'état du joueur humain est :"
    puts hp.show_state
    #Affichage menu de jeu
    print "
  Quelle action veux-tu effectuer ?

  a - chercher une meilleure arme
  s - chercher à se soigner

  attaquer un joueur en vue :
  0 -"
  print  player1.show_state
  print "  1 -"
  print player2.show_state

    #Au tour du joueur humain
    answer = gets.chomp
    if answer == "a"
      hp.search_weapon
    elsif answer == "s"
      hp.search_health_pack
    elsif answer == "0"
      hp.attack(player1)
    elsif answer == "1"
      hp.attack(player2)
    end

    #Au tour des autres joueurs
    if ennemies.size > 1
      puts "\n\nLes autres joueurs t'attaquent !"
    end

    ennemies.each do |ennemy|
      if ennemy.life_points < 1
        ennemies.delete(ennemy)
      end
      ennemy.attack(hp)
    end

end
###############

#Conclusion
puts "\n\n
 _______________________
| La partie est terminée |
 ------------------------
 "
if hp.life_points >0
  puts "Bravo ! La force était avec toi et tu as gagné"
else
  puts "T'es mauvais Jack ! T'es mauvais !"
end
