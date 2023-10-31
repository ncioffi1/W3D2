class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end

    
    def build
        suits = ["H", "S", "D", "C"]
        cards = []
        subArr = []
        suits.each do |ele|
            (1..13).each do |n1|
                subArr << ele
                if n1 == 1
                    subArr << "A"
                elsif n1 == 11
                    subArr << "J"
                elsif n1 == 12
                    subArr << "Q"
                elsif n1 == 13
                    subArr << "K"
                else
                    subArr << n1
                end
                subArr2 = subArr.join("")
                cards << subArr2
                subArr = []
            end
        end
        return cards
    end

    p build
    # .shuffle

    def populate

    end
end