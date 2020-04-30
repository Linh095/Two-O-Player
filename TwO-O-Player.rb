class Player
  def initialize(name, number)
    @name = name
    @number = number
    @score = 3
  end

  def name_reader
    @name
  end

  def number_reader
    @number
  end

  def score_reader
    @score
  end

  def score_writer
    @score -= 1
  end
end

def turn(player)
  num_1 = rand(20)
  num_2 = rand(20)
  sum = num_1 + num_2
  @correct = false

  puts "----- NEW TURN -----"
  puts "Player #{player.number_reader}: What does #{num_1} plus #{num_2} equal?"
  print "> "

  player_sum = $stdin.gets.chomp.to_i
  
  if player_sum == sum
    @correct = true
    puts "YES! You are correct."
  else
    player.score_writer
    puts "Seriously? No!"
  end

  return @correct
end

def game_end(player_1, player_2)
  winner = nil
  if player_1.score_reader > player_2.score_reader
    winner = player_1
  else
    winner = player_2
  end

  puts "---- WE HAVE A WINNER ----- \n \n"
  puts "#{winner.name_reader} wins with a score of #{winner.score_reader}/3! \n \n"
  puts "----- GAME OVER -----"
  puts "Good bye!"
  exit(0)
end

def game_play
  puts "Let's play the TwO-O-Player game!"
  puts "Your mental math skills will be tested"
  puts "What is the first player's name?"
  print "> "

  name_1 = $stdin.gets.chomp

  player_1 = Player.new(name_1, 1)

  puts "What is the first player's name?"
  print "> "

  name_2 = $stdin.gets.chomp

  player_2 = Player.new(name_2, 2)

  puts "Answer incorrectly 3 times and you're done!"
  puts "Let's start. \n \n"

  turn_counter = 1
  while player_1.score_reader > 0 && player_2.score_reader > 0
    if turn_counter % 2 != 0
      turn(player_1)

      puts "#{player_1.name_reader}: #{player_1.score_reader}/3 #{player_2.name_reader}: #{player_2.score_reader}/3 \n \n"

    else
      turn(player_2)

      puts "#{player_1.name_reader}: #{player_1.score_reader}/3 #{player_2.name_reader}: #{player_2.score_reader}/3 \n \n"
    end

    turn_counter += 1
  end

  game_end(player_1, player_2)
  
end

game_play