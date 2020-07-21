require 'pry'

class Game

  attr_accessor :human_player, :enemies

  def initialize(human_player)
    @human_player = HumanPlayer.new(human_player)
    player1 = Player.new("maître_jedi_1")
    player2 = Player.new("maître_jedi_2")
    player3 = Player.new("maître_jedi_3")
    player4 = Player.new("maître_jedi_4")
    @enemies = [player1, player2, player3, player4]
  end

  def kill_player(player)
    enemies.delete(player)
  end

  def is_still_ongoing?
    if human_player.life_points > 0 && enemies.size > 0
      return true
    end
  end

  def show_players
    human_player.show_state
    puts "Il reste #{enemies.size} maître jedi à détruire"
  end

  def menu
    print "
  Quelle action veux-tu effectuer ?

  a - chercher une meilleure arme
  s - chercher à se soigner

  attaquer un joueur en vue :
  "
    for enemy in 0..enemies.size-1
      print "#{enemy} - "
      print enemies[enemy].show_state
    end
  end

  def menu_choice(choice)
    if choice == "a"
      human_player.search_weapon
    elsif choice == "s"
      human_player.search_health_pack
    else
      puts "#{human_player.name} attaque #{enemies[choice.to_i].name}"
      human_player.attack(enemies[choice.to_i])
      enemies[choice.to_i].show_state
      if enemies[choice.to_i].life_points == 0
        kill_player(enemies[choice.to_i])
      end
    end
  end

  def ennemies_attack
    enemies.each do |enemy|
      puts "#{enemy.name} attaque :"
      enemy.attack(human_player)
    end
    print human_player.show_state
  end

  def end
    puts "\n\n
     _______________________
    | La partie est terminée |
     ------------------------
     "
    if human_player.life_points >0
      puts "
    _____________________________________________________
  |    ______________________________________________    |
  |  | Bravo ! La force était avec toi et tu as gagné |  |
  |   ----------------------------------------------     |
    -----------------------------------------------------
      "
    else
      puts "
      ________________________________________
    |    __________________________________    |
    |  | T'es mauvais Jack ! T'es mauvais ! |  |
    |   -----------------------------------    |
      ----------------------------------------
      "
    end
  end

end
#binding.pry
