class Player

  def play_turn(warrior)

    @warrior = warrior
    @action_taken = false

    shoot_wizard if clear_line_to_wizard?  
    check_for_rest    unless @action_taken
    check_for_walk    unless @action_taken
    check_for_wall    unless @action_taken
    check_for_captive unless @action_taken

    
      

    #default ATTACK!!
    warrior.attack! unless @action_taken

    #save warrior health
    @health = warrior.health

  end #end play_turn


  def check_for_rest
    print "check_for_rest ->  "
    if @warrior.health < 20 && damaged_prev_turn?
      puts  "low health and not hit -> resting"
      @warrior.rest!
      @action_taken = true
    else
      if @warrior.health <= 12
        puts  "low health and hit - > not resting -> retreat"
        @warrior.walk!(:backward)
        @action_taken = true
      else
        puts "rest not needed"
      end
    end
  end

  def check_for_walk
    print "check_for_walk ->  "
    if @warrior.feel.empty?
      @warrior.walk!
      @action_taken = true
      puts "walking"
    else 
      puts "not walking"
    end
  end

  def check_for_wall
    print "check_for_wall ->  "
    if @warrior.feel.wall?
      puts "#felt wall"
      @warrior.pivot!
      @action_taken = true
    end
  end

  def check_for_captive
    print "check_for_captive ->  "
    if @warrior.feel.captive?
      puts "#felt captive"
      @warrior.rescue!
      @action_taken = true
    end
  end

  def damaged_prev_turn?
    puts "damaged_prev_turn?"
    @health <= @warrior.health
  end

  def clear_line_to_wizard?
    print "clear_line_to_wizard? -> "
    see = @warrior.look
    see.delete_if {|l| l.unit.to_s == ""}
    result = see.first.to_s == "Wizard" ?  true : false
    puts 
    return result
  end

def shoot_wizard
  puts "Shooting Wizard"
  @warrior.shoot!
  @action_taken = true
end

end  #class
