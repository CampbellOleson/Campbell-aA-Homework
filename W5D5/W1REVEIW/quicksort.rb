class Array

    def quicksort
        return self.dup if self.size <= 1
        
        pivot = self.first

        left = self.drop(1).select {|el|el < pivot}
        right = self.drop(1).select {|el|el >= pivot}
        sorted_left = left.quicksort
        sorted_right = right.quicksort

        sorted_left + [pivot] + sorted_right

    end

end



array_1 = [1,2,3,4,4,5,6,7,8,9].shuffle
array_2 = [1,2,2,3,4,5,6,7,8,9].shuffle

p array_1.quicksort
p array_2.quicksort

