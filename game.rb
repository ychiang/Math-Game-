require_relative "questions.rb"
require_relative "players.rb"


class Game
  def initialize(player1, player2)
    @player1 = Player.new(player1);
    @player2 = Player.new(player2);
    @current_player = @player1

    puts "Welcome #{@player1.instance_variable_get(:@name)} and #{@player2.instance_variable_get(:@name)}! Let's start with #{@current_player.instance_variable_get(:@name)}"
  end

  def display_score
    puts "Current Score - #{@player1.name}: #{@player1.instance_variable_get(:@lives)}, #{@player2.name}: #{@player2.instance_variable_get(:@lives)}"
  end 

  def change_player
    if (@current_player == @player1)
      @current_player = @player2
    elsif (@current_player == @player2)
      @current_player = @player1
    end 
  end

  def ask_question()
    question = Questions.new(@current_player.instance_variable_get(:@name))
    answer = gets.chomp 
    return [question, answer]
  end 

  def check_answer(player_turn)
    question = player_turn[0]
    answer = player_turn[1]
    if (question.check_answer(answer))
      puts "That's Correct!"
    else (!question.check_answer(answer))
      puts "Oh NO! #{@current_player.instance_variable_get(:@name)} You just lost a life!"
      @current_player.lose_life()
    end
  end 

  def game_status
    while (!@player1.dead?() && !@player2.dead?())
      player_turn = self.ask_question()
      self.check_answer(player_turn)
      self.change_player()
      self.display_score()
    end
    puts "----------------GAME OVER-----------------"
    puts "#{@current_player.instance_variable_get(:@name)} WON!"
  end 
end


p = Game.new("Grace", "David")
p.game_status
