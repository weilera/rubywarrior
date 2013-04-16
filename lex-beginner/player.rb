class Player
  def play_turn(warrior)

  if warrior.feel.empty?
    puts "#nothing in direction"
    if ((warrior.health < 20) && (@health <= warrior.health))
      puts  "low health and not hit"
      warrior.rest!
    else
      if warrior.health > 12
        puts  "high health and hit"
        warrior.walk!
      else
        puts  "low health and hit"
        warrior.walk!(:backward)
      end
    end
  else
    puts "#something in direction"
    if warrior.feel.wall? 
     puts "#felt wall"
     warrior.pivot!
    elsif warrior.feel.captive? 
      puts "#felt captive"
      warrior.rescue! 
    else
      #default ATTACK!!
      warrior.attack!
    end
  end
  @health = warrior.health
end #end play_turn



end  #class


#warrior.feel(:backward).wall?

