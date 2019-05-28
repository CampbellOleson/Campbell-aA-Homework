require "byebug"

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) 
# should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start, ending) #(1,3) #=> [1,2]
    return [] if ending < start
    return [start] if ending == start || ending - 1 == start
    range(start, ending-1) << ending - 1 #=> [1] << 2
end

# range(start, ending-1) << ending - 1 #=> [1]

# p range(1,0) #=> []
# p range(1,1) #=> [1]
# p range(1,2) #=> [1]
# p range(1,3) #=> [1,2]
# p range(1,5) #=> [1,2,3,4]

# Write both a recursive and iterative version of sum of an array.

def sum(arr)
    return 0 if arr.empty?
    sum(arr[0...-1]) + arr.last
end

def sum(arr)
    arr.inject(:+)
end

# p sum([5,4,6])

# def exponentiation(b,n)
#     return 1 if n == 0
#     b * exponentiation(b, n-1)
# end

def exponentiation(b,n)
    return 1 if n == 0
    
    if n.even?
        prev_exponentiation = exponentiation(b, n/2)
        return prev_exponentiation * prev_exponentiation
    else
        prev_exponentiation = exponentiation(b, (n-1)/2)
        return b * (prev_exponentiation * prev_exponentiation)
    end
end

# p exponentiation(2, 0) #= 1
# p exponentiation(2, 1) #= 2
# p exponentiation(2, 2) #= 4
# p exponentiation(2, 3) #= 8

class Array
    def duper
    new_arr = []

        self.each do |el|
            if el.is_a?(Array)
                new_arr << el.duper
            else 
                new_arr << el
            end
        end

    new_arr
    end
end

def duper(arr)
new_arr = []

    arr.each do |el|
        if el.is_a?(Array)
            new_arr << duper(el)
        else 
            new_arr << el
        end
    end

new_arr
end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# p robot_parts_copy = robot_parts
# p robot_parts_copy[1] << "LEDs"
# p robot_parts
# p robot_parts_copy

# puts

# p robot_parts_copy = robot_parts.duper
# p robot_parts_copy[1] << "LEDs"
# p robot_parts
# p robot_parts_copy


# Write a recursive and an iterative Fibonacci method. The method should 
# take in an integer n and return the first n Fibonacci numbers in an array.


def fib(n)
    return [0,1].take(n) if n <= 2
    previous_fib = fib(n-1) 
    previous_fib << (previous_fib[-1] + previous_fib[-2]) #=> 3
end

# p fib(0) #=> []
# p fib(1) #=> [0]
# p fib(2) #=> [0,1]
# p fib(3) #=> [0,1,1]
# p fib(4) #=> [0,1,1,2]
# p fib(5) #=> [0,1,1,2,3] -> fib(n-1) #=> [0,1,1,2]


def bsearch(arr, num)
    probe_index = arr.size/2
    mid_ele = arr[middle_index]
    return nil if mid_ele != num && arr.size == 1
    return middle_index if mid_ele == num

    if num > mid_ele
        searched_half = bsearch(arr.drop(probe_index), num)
        return nil if searched_half.nil?
        searched_half + (probe_index + 1)
    else
        bsearch(arr.take(probe_index), num)
    end
end


def bsearch(arr,target)
    mid_i = arr.size/2
    check_el = arr[mid_i]
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([1, 3, 4, 5, 9], 3) # => 1
# p bsearch([1, 3], 3) # => 
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5, mid index 3, mid ele 4
# p bsearch([4, 5, 6], 6) #  -> mid index 1, mid ele 5
# p bsearch([5, 6], 6) # => mid index 1, mid ele 6
# p bsearch([6], 6) # => mid index 0, mid ele 6




def merge(arr_1,arr_2)
    # debugger
    merged_arr = []
    until arr_1.size == 0 && arr_2.size == 0

        if arr_1.size == 0 && arr_2.size != 0
            merged_arr += arr_2
            break
        elsif arr_2.size == 0 && arr_1.size != 0
            merged_arr += arr_1
            break
        end

        if arr_1.first > arr_2.first
            merged_arr << arr_2.shift
        else arr_1.first <= arr_2.first 
            merged_arr << arr_1.shift
        end

    end
    merged_arr
end

def merge_sort(arr)
    return arr if arr.length == 0 || arr.length == 1
    first_half = merge_sort(arr.take(arr.length/2))
    second_half = merge_sort(arr.drop(arr.length/2))
    merge(first_half, second_half)
end


# arr_1 = [1,2,3,4,5,6,7,8,9,10].shuffle
# p arr_1
# p merge_sort(arr_1)


def subsets(arr) #=> [1, 2], returns => [[], [1], [2], [1, 2]]
    return [[]] if arr.empty?
    last_call = subsets(arr[0...-1]) #=> [1] #=> [[], [1]]
    new_arr = [last_call.last, arr.last]
    modified = subsets(arr[0...-1]) << arr.last 
    modified += new_arr
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


