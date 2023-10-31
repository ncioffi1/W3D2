class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end

    def populate

    end
end