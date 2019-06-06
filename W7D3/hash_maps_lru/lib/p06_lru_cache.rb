require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    
    if @map.include?(key)
      found_node = @map[key]
      update_node!(found_node)
      return found_node.val
    else #=> put the key in the hash/ll
      new_node = calc!(key)
      @map[key] = new_node
      eject!
      @store.append(new_node)
    end

  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    Node.new(key,val) #=> what is the value?
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    @store.append(node.key,node.val)
  end

  def eject!
    @store.first.remove
  end
end
