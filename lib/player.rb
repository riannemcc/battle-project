class Player 
  
  DEFAULT_HIT_POINTS = 100
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

#   def hit_points
#     @hit_points
#   end

  def attack
    @hit_points -= 15
  end

end