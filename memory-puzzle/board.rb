require_relative "card"

class Board

    attr_reader :size, :grid

    def initialize(vertical, horizontal)
        @size = horizontal * vertical
        if @size % 2 != 0
            raise "error:  board size needs to be even..."
        elsif @size > 32
            raise "error:  board size needs to be <= 32..."
        end
        @grid = Array.new(vertical) { Array.new(horizontal) }
        @possible_values = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"]
    end

    
    # def build
    #     suits = ["H", "S", "D", "C"]
    #     cards = []
    #     subArr = []
    #     suits.each do |ele|
    #         (1..13).each do |n1|
    #             subArr << ele
    #             if n1 == 1
    #                 subArr << "A"
    #             elsif n1 == 11
    #                 subArr << "J"
    #             elsif n1 == 12
    #                 subArr << "Q"
    #             elsif n1 == 13
    #                 subArr << "K"
    #             else
    #                 subArr << n1
    #             end
    #             subArr2 = subArr.join("")
    #             cards << subArr2
    #             subArr = []
    #         end
    #     end
    #     return cards
    # end

    # p build
    # .shuffle

    def populate
        target = @size / 2   # 8
        possibles = []  
        (0...target).each do |i1|
            possibles << @possible_values[i1]
        end
        # deck = self.build
        deck2 = possibles.shuffle
        deck3 = []
        deck2.each do |ele|
            2.times do
                deck3 << ele
            end
        end
        deck4 = deck3.shuffle
        counter = 0

        @grid.each_with_index do |row, i1|
            row.each_with_index do |ele, i2|
                card1 = Card.new(deck4[counter], false)
                @grid[i1][i2] = card1
                counter += 1
            end
        end
    end

    # 
    def render
        print "===========\n"
        @grid.each do |row|
            row.each do |card|
                card.display
                print " "
            end
            print "\n"
        end
        print "===========\n"
    end

    def won?
        is_all_face_up = true
        @grid.each do |row|
            row.each do |card|
                if !card.face_up
                    is_all_face_up = false
                end
            end
        end
        print "big brain"
        sleep(2)
        return is_all_face_up
    end

    # [1, 4]    response[0]
    # 0 2      response[0].to_i
    def reveal(guessed_pos)
        row = guessed_pos[0]
        col = guessed_pos[1]
        card = @grid[row][col]
        card.reveal
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        card = @grid[row][col]
        return card
    end

    def cheat
        @grid.each_with_index do |row, i1|
            row.each_with_index do |card, i2|
                if i1 == 3 && i2 == 3
                    # do nothing
                else
                    card.reveal
                end
            end
        end
        self.render
        sleep(2)
        @grid.each_with_index do |row, i1|
            row.each_with_index do |card, i2|
                card.hide
            end
        end
    end


    # def print_grid


    #     # print @grid
    # end
end

# b = Board.new(4, 4)
# b.populate
# b.render
# b.reveal([0, 0])
# b.render
# b.print_grid