class Dice
  attr_reader :current_side
  
  def initialize
    roll
  end
  
  def roll
    @current_side = get_random_side
  end

private

  def get_random_side
    rand(6) + 1
  end

end