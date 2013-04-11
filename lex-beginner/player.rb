class Player
  def play_turn(warrior)

  if warrior.feel.empty?
  	#nothing in front
    if ((warrior.health < 20) and (@health <= warrior.health))
        warrior.rest!
    else
       warrior.walk!
    end
  else
    #something in front
    warrior.attack!
  end
  @health = warrior.health
  end
end
