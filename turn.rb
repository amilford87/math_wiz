require_relative 'player'

class Turn

    def initialize(players)
        @players = players.dup.shuffle
        @current_turn = 0
    end

    def current_player
        @players[@current_turn % 2]
    end

    def next_turn
        @current_turn += 1
    end
end

