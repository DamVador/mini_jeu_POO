require 'pry'

class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{self.name} à #{self.life_points} points de vie"
  end

  def gets_damage(damages)
    if self.life_points - damages < 1
      self.life_points = 0
      puts "
      –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    | Le joueur #{self.name} est mort et la galaxy est sauvé de son emprise, pour le meilleur ou pour le pire |
      -------------------------------------------------------------------------------------------------------
      "
    else
      self.life_points = self.life_points - damages
    end
  end

  def attack(player)
    if self.life_points == 0
      damage = 0
    else
      damage = compute_damage
      puts "le joueur #{self.name} attaque le joueur #{player.name}"
      puts "le joueur #{self.name} inflige #{damage} points de dommages"
    end
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
      puts "#{self.name} à #{self.life_points} points de vie et une arme de niveau #{self.weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
      new_weapon_level = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

      if @weapon_level < new_weapon_level
        @weapon_level = new_weapon_level
        puts "Maître Yoda n'a qu'a bien se tenir, cette arme est meilleur que ton arme actuelle : tu la prends"
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
        puts "Tu n'as rien trouvé... "
    elsif health_pack >= 2 && health_pack <= 5
        if (@life_points + 50) > 100
            @life_points = 100
        else
          @life_points +=  50
        end
        puts  "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif health_pack == 6
      if (@life_points + 80) > 100
          @life_points = 100
      else
        @life_points += 80
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end


end
