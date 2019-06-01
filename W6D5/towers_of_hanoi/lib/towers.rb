class Disk
    attr_reader :size
    def initialize(n)
        @size = n
    end
end

class Peg
   attr_reader :disks
    def initialize(dis = [])
        @disks = []
        dis.each do |d|
            @disks << Disk.new(d)
        end
    end

    def inspect
        
    end

end

peg1 = Peg.new([3,2,1])
peg2 = Peg.new
peg3 = Peg.new

