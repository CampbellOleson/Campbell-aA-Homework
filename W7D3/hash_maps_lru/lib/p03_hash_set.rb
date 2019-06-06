class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.count == num_buckets - 1 && !self.include?(key)
     resize!
    end

    if !self.include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
      bucket = self[key]
      bucket.include?(key) 
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private


  def [](key)
    mod = key.hash % num_buckets
    @store[mod]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = @store.size * 2
    new_store = Array.new(new_size) { Array.new }

    @store.each do |bucket|
      bucket.each do |ele|
        new_bucket = ele.hash % new_size
        new_store[new_bucket] << ele
      end
    end

    @store = new_store
  end

end
