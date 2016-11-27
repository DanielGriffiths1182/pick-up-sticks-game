class Sticks
  attr_accessor :stick_amount, :player_1_sticks_taken, :player_2_sticks_taken, :computer

  def initialize(stick_amount, player_1_sticks_taken, player_2_sticks_taken, computer)
    @stick_amount = stick_amount
    @player_1_sticks_taken = player_1_sticks_taken
    @player_2_sticks_taken = player_2_sticks_taken
    @computer = computer
  end

  def get_computer_pickup_sticks
    if @stick_amount > 5
      @computer = rand(1..5)
    else
      @computer = 5
    end
  end

  def player_1_stick_change(player_1)
    @player_1_sticks_taken += player_1
    @stick_amount -= player_1
  end

  def player_2_stick_change(player_2)
    @player_2_sticks_taken += player_2
    @stick_amount -= player_2
  end
end


game = Sticks.new(50, 0, 0, rand(1..5))




until game.stick_amount <= 0.to_i do
  puts "There are #{game.stick_amount} sticks on the table."
  puts "Player One, pick up 1-5 sticks"
    player_1 = gets.chomp.to_i
  if player_1 > 5
    puts "Player One, pick up 1-5 sticks or you will forfiet your turn and one stick will be added."
      player_1 = gets.chomp.to_i
      game.stick_amount += 1
  elsif player_1 < 1
    puts "Player One, pick up 1-5 sticks or your turn will be forfiet and one stick will be added."
      player_1 = gets.chomp.to_i
      game.stick_amount += 1
  else
      game.player_1_stick_change(player_1)
  end
  puts "There are #{game.stick_amount} sticks on the table"
  puts "Player Two, pick up 1-5 sticks"
  game.get_computer_pickup_sticks
  player_2 = game.computer
  puts player_2
  game.player_2_stick_change(player_2)
end
puts "GAME OVER MOTHAFUCKA"
