class TowersOfHanoi
    attr_reader :towers
    def initialize
        @towers = [[1,2,3],[],[]]
    end

    def valid_move?(disk,tower)
        return false if tower.any? {|d|d < disk}
        

end