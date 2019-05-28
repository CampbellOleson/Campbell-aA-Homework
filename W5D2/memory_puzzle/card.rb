class Card
    
    attr_reader :face_value, :flipped

    def initialize(face_value); @face_value, @flipped = face_value, false; end

    def display
        @flipped ? @face_value : ' '
    end

    def flip; @flipped ? @flipped = false : @flipped = true; end

    def to_s; @face_value.to_s; end

    def ==(card); @face_value == card.face_value; end

end