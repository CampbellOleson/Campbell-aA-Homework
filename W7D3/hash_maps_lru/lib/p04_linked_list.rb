require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    if @head.next == @tail && @tail.prev == @head
    return true
    end
    false
  end

  def get(key)
      self.each do |node|
        return node.val if node.key == key
      end
    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    node = Node.new(key,val)      #head - #ele1 - #tail
    tail_node = @tail
    prev_to_tail = tail_node.prev
    node.next = tail_node
    node.prev = prev_to_tail
    prev_to_tail.next = node
    tail_node.prev = node
  end

  def update(key, val)
    self.each do |node|
      # debugger
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      node.remove if node.key == key
    end
  end

  def each(&prc)
    current_node = self.first
    until current_node == @tail
        prc.call(current_node)
        current_node = current_node.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
