class Array
    def my_uniq
       self.uniq
    end
    
    def two_sum
        pairs = []
        (0...self.length).each do |i1|
            ( i1+1...self.length).each do |i2|
                pairs << [i1,i2] if self[i1] + self[i2] == 0
            end
        end
        pairs
    end

    def my_transpose
        self.transpose
    end

    def stock_picker
        best_pair = [self[0],self[1]]
        (0...self.length - 1).each do |i1|
            (i1...self.length).each do |i2|
                best_pair = [i1,i2] if (self[i2] - self[i1]) > (best_pair[1] - best_pair[0])
            end
        end
        best_pair
    end
    
end


