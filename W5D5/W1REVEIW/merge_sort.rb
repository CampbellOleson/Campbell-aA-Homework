class Array

    def merge_sort(&prc)
        prc ||= Proc.new {|a,b| a <=> b }
        return self if self.size == 1 || self.size == 0
        split_index = self.size / 2
        right = self.take(split_index)
        left = self.drop(split_index)
        sorted_left = left.merge_sort(&prc)
        sorted_right = right.merge_sort(&prc)
        Array.merge(sorted_left,sorted_right,prc)
    end


    def self.merge(left,right,prc)
        merged = []
        until left.empty? || right.empty?
            if prc.call(left[0],right[0]) == 1
                merged << right.shift
            else
                merged << left.shift
            end
        end
        merged + left + right
    end

end

# test 

array_1 = [1,2,3,4,5,6,7,8,9,10].shuffle
array_2 = [1,2,3,4,5,6,7,8,9,10].shuffle

p array_1.merge_sort #ascending default
p array_1.merge_sort {|a,b|a<=>b} #ascending explicit
p array_2.merge_sort {|a,b|b<=>a} #descending explicit