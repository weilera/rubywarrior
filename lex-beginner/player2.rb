class Player

  @@max_health = 20
  @@directions = [:forward,:backward]

  def play_turn(warrior)
    # add your code here
    # puts "@warrior.health #{@warrior.health}"
    # puts "@health #{@health}"
    if !@direction
      @direction = @@directions.fetch(0)
    end

    @warrior = warrior
    @action_taken = false

    puts "#{@warrior.feel(@direction)}"

    check_for_rest unless @action_taken
    check_for_walk unless @action_taken
    check_for_captive unless @action_taken
    check_direction unless @action_taken
    check_attack unless @action_taken

    @health = @warrior.health 
  end

  def check_for_rest
    if @warrior.feel(@direction).empty?
      if @warrior.health < @@max_health && @warrior.health >= @health
        @warrior.rest!
        @action_taken = true
      else
        if @warrior.health <= 15
          @warrior.walk!(:backward)
          @action_taken = true
        end
      end
    end
  end

  def check_for_walk
    if @warrior.feel(@direction).empty?
      @warrior.walk!(@direction)
      @action_taken = true
    end
  end

  def check_for_captive
    if @warrior.feel(@direction).captive?
      @warrior.rescue!(@direction)    
      @action_taken = true
    end
  end

  def check_direction
    if @warrior.feel(@direction).wall?
      @warrior.pivot!
      @action_taken = true
    end
  end

  def check_attack
    @warrior.attack!(@direction)
    @action_taken = true
  end

end