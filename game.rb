require_relative 'player'
require_relative 'turn'
require_relative 'question'

class Game
    def initialize
        @player1 = Player.new("Player 1")
        @player2 = Player.new("Player 2")
        @players = [@player1, @player2]
        @turn = Turn.new(@players)
    end

    def play
        while (not game_over?)
            current_player = @turn.current_player
            turn = @turn.next_turn
            question = Question.new
            
            puts "#{current_player.name}: " + question.get_question
            player_answer = gets.chomp.to_i
    
            if player_answer == question.get_answer
                puts "#{current_player.name}: YES! You are correct!"
            elsif player_answer != question.get_answer 
                puts "#{current_player.name}: Seriously? No!"
                current_player.lose_life
            end
            
            puts 
            puts game_summary
            
            header "Next Turn"
        end

        if @player1.lives == 0 
            winning_player = @player2
            puts "#{winning_player.name} wins with a score of #{winning_player.lives}/3"
        elsif @player2.lives == 0
            winning_player = @player1
            puts "#{winning_player.name} wins with a score of #{winning_player.lives}/3"
        end
        
        puts
        puts "==== 💀 GAME OVER 💀 ===="
        puts
    end

    def game_over?
        @player1.lives == 0 || @player2.lives == 0
    end

    def header(message)
        puts
        puts "==== 💎 #{message} 💎 ===="
        puts
    end

    def game_summary
        "Player 1: #{@player1.lives}/3 vs Player 2: #{@player2.lives}/3"
    end

end