class Array
    def my_flatten
        return [self] if !self.is_a?(Array)
        flattened = []
        self.each do |el|
            if el.is_a?(Array)
                flattened += el.my_flatten
            else 
                flattened << el
            end
        end
        flattened
    end
end
array_1 = [1,2,[3,4,5],6,[[7]],8,[9,10]]
