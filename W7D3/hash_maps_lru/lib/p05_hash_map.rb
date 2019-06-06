require_relative 'p04_linked_list'
require 'byebug'
class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).each do |node|
      return true if node.key == key
    end
    false
  end

  def set(key, val)
    if !include?(key) 
      resize! if @count == num_buckets - 1
      bucket(key).append(key,val)
      @count += 1
    else
      bucket(key).update(key,val)
    end
  end

  def get(key)
    bucket(key).each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |link_list|
      link_list.each do |node|
        prc.call([node.key, node.val])
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = @store.size * 2
    new_store = Array.new(new_size) { LinkedList.new }

    @store.each do |bucket|
      bucket.each do |node|
        new_bucket = node.key.hash % new_size
        new_store[new_bucket].append(node.key,node.val)
      end
    end

    @store = new_store
  end

  def bucket(key)
    mod = key.hash % num_buckets
    @store[mod]
  end
end
