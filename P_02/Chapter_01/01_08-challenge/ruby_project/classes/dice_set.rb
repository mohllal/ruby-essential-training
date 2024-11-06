require_relative 'dice'

class DiceSet
  def initialize(dice_array = [])
    @dice_array = [Dice.new, Dice.new] if dice_array.empty?
  end

  def roll
    @dice_array.each { |dice| dice.roll }
  end

  def display
    @dice_array.map {|dice| "[ #{dice.current_side} ]" }.join(' - ')
  end
end