require 'byebug'
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5
# time complexity: O(n^2)
def my_min(arr)
    min = arr[0]
    (0...arr.size).each do |i1|
        (i1 + 1...arr.size).each do |i2|
            min = arr[i2] if arr[i2] < min
        end
    end
    min
end

# p my_min(list)
# O(n)
def my_min_(arr)
    min = arr[0]
    arr.each do |el|
        min = el if el < min
    end
    min
end

# p my_min_(list)
# list = [5, 3, -7]
# O(n^3)
def contiguous_sum(arr)
    sums = []
    (0...arr.size).each do |i1|
        (i1...arr.size).each do |i2|
            sums << arr[i1..i2]
        end
    end
    max = 0
    sums.each {|el|max = el.sum if el.sum > max}
    max
end

# p contiguous_sum(list)
list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
def contiguous_sum_(arr)
    return arr.max if arr.all? {|el|el < 0}
    biggest = arr[0]
    current = arr[0]
    arr[1..-1].each do |el| #=> 2n
        current = 0 if current < 0
        current += el
        biggest = current if current > biggest
    end
    return biggest
end

# p contiguous_sum_(list3)