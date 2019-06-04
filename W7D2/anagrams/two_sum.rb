def two_sum?(arr, target_sum)
   arr.each_with_index do |ele, i|
    arr.each_with_index do |ele2, i2|
        if i2 > i
            return true if ele + ele2 == target_sum 
        end
     end
    end
    false
end

arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be falses