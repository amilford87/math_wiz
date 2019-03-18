class Player
    attr_accessor :lives, :name

    MAX_LIVES = 3

    def initialize(name)
        @name = name
        @lives = MAX_LIVES
    end

    def lose_life
        @lives -= 1
    end

end