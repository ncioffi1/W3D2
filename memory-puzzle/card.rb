class Card

    attr_reader :face_up, :face_value

    def initialize(face_value, face_up)
        @face_value = face_value
        @face_up = face_up
    end



    def display
        if !@face_up
            print "--"
        else
            print @face_value
        end
    end

    def hide
        if @face_up
            @face_up = false
        end
    end

    def reveal
        if !@face_up
            @face_up = true
        end
    end

    def ==(comp_card)
        if comp_card.face_value == self.face_value
            return true
        else
            return false
        end
    end


end