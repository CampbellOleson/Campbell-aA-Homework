require 'byebug'
class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  attr_reader :store

  def insert(num)
    if num <= @store.length && num >= 0
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if self.include?(num)
      @store[num] = false
    end
  end

  def include?(num)
    @store[num]
  end

  private
  # already wrote this logic
  # def is_valid?(num)
  # end

  # def validate!(num)
  # end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num) 
  end

  private #=> self.private_method NOT ALLOWED

  def [](num)
    mod = num % @store.size
    @store[mod]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.count == @store.size - 1 && !self.include?(num)
     resize!
    end

    if !self.include?(num)
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = self[num]
    bucket.include?(num) 
  end

  private

  def [](num)
    mod = num % @store.size
    @store[mod]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = store.size * 2
    new_store = Array.new(new_size) { Array.new }

    @store.each do |bucket|
      bucket.each do |ele|
        new_bucket = ele % new_size
        new_store[new_bucket] << ele
      end
    end

    @store = new_store
  end
end
