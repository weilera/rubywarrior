class Player
def play_turn(warrior)

@direction ||= :backward	

if warrior.feel(@direction).wall? 
  @direction = flip(@direction)
end

if warrior.feel(@direction).empty?
  	#nothing in direction
    if ((warrior.health < 20) and (@health <= warrior.health))
    	# low health and not hit
        warrior.rest!
    else
    	if warrior.health > 10
          warrior.walk!(@direction)
        else
          warrior.walk!(flip(@direction))
        end
    end
else
    #something in direction

    if warrior.feel(@direction).captive? 
    	warrior.rescue!(@direction)
    else
      warrior.attack!(@direction)
    end
end
@health = warrior.health
end #end play_turn

def flip(direction)
  case 
  when direction == :forward
  	direction = :backward
  when direction == :backward
  	direction = :forward
  end 
end #end flip


end  #class





#warrior.feel(:backward).wall?

 