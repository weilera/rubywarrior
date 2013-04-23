class Player
  def play_turn(warrior)
  	direction = warrior.direction_of_stairs
  	if warrior.feel(direction).enemy?
  		warrior.attack!(direction)
  	else
  	    warrior.walk!(direction)
  	end
  	
    # add your code here
  end
end
