class Question

    def initialize
        @a = 1 + rand(10)
        @b = 1 + rand(10)
    end

    def get_answer
    @a + @b
    end

    def get_question
        "What is #{@a} + #{@b}?"
    end

end


