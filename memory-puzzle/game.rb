require_relative "board"
require_relative "card"

require "byebug"

class Game

    attr_reader :is_checking, :previous_guess, :board

    def initialize(v_size, h_size)
        @board = Board.new(v_size, h_size)
        @previous_guess = []
        @is_checking = false
    end

    def play
        @board.populate
        # @board.cheat
        while !@board.won?
            @board.render
            print "input a position to guess.  x space y."
            response = gets.chomp
            if response == "quit"
                return true
            end
            row = response[0].to_i
            col = response[2].to_i
            pos = [row, col]
            make_guess(pos)
        end
    end

    def make_guess(pos)
        # debugger
        @board.reveal(pos)
        if !@is_checking
            # leave card at guessed_pos up.
            # update previous guess variable.
            @previous_guess += [@board[pos]]
            @is_checking = true
        else
            if @previous_guess[0] == @board[pos]
                # if match, leave them face up.
            else
                @board.render
                sleep(2)
                @previous_guess[0].hide
                current_card = @board[pos]
                current_card.hide
            end
            @is_checking = false
            @previous_guess = []
            system("clear")
        end
    end



end