class Player
def play_turn(warrior)



if warrior.feel.empty?
  	#nothing in direction
    if ((warrior.health < 20) and (@health <= warrior.health))
    	# low health and not hit
        warrior.rest!
    else
    	if warrior.health > 10
          warrior.walk!
        else
          warrior.walk!
        end
    end
else
    #something in direction
    if warrior.feel.wall? 
       warrior.pivot!
    end
    if warrior.feel.captive? 
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

 