# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.empty?
  probe_index = arr.size / 2
  probe_ele = arr[probe_index]

  case probe_ele <=> target
  when 1
    left_arr = arr.take(probe_index) 
    return binary_search(left_arr,target)
  when 0 
    return probe_index
  when -1
    compensated_index = (probe_index + 1)
    right_arr = arr.drop(compensated_index)
    return nil if binary_search(right_arr,target).nil?
    return binary_search(right_arr,target) + compensated_index
  end
end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    (0...self.length).each do |i1|
      (i1+1...self.length).each do |i2|
        pairs << [i1,i2] if (self[i1] + self[i2]) == target
      end
    end
    pairs
  end
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
return nums[0] if nums.size == 1
return 0 if nums.size == 0
  nums[0] + sum_rec(nums[1..-1])
end

class String
  # Write a method that finds all the unique substrings for a word

  def uniq_subs
    subs = []
    (0...self.size).each do |i1|
      (i1...self.size).each do |i2|
        subs << self[i1..i2] if !subs.include?(self[i1..i2]) 
      end
    end
    subs
  end
end

def prime?(num)
  return false if num < 2
  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  primes = []
  i = 2
  while primes.size < n
    primes << i if prime?(i)
    i += 1
  end
  primes.sum
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < self.size
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write a method that calls a block for each element of the array
  # and returns a new array made up of the results
  def my_map(&prc)
    arr = self.dup
    i = 0
    while i < arr.size
      arr[i] = prc.call(arr[i])
      i += 1
    end
    arr
  end
end
