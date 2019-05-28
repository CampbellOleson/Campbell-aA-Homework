require 'byebug'

class PolyTreeNode
   
    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_node) 
        if !self.parent.nil?
        self.parent.children.delete(self) 
        end
        @parent = new_node
        new_node.children << self if !new_node.nil? && !new_node.children.include?(self)
    end

    def add_child(child)
        @children << child
        child.parent=(self)
    end

    def remove_child(child) 
        raise if !@children.include?(child)
        child.parent = nil
    end

    def dfs(target) #1,2,3,4,5,6   target = 3

        return self if self.value == target
        self.children.each do |child|
             search_result = child.dfs(target)
            return search_result unless search_result.nil?
           
        end
        nil
    end

    def bfs(target)
    queue = [self]
    # debugger
        until queue.empty?
            queue[0].children.each {|child|queue << child}
            return queue[0] if queue[0].value == target
            queue.shift
        end
        nil 
    end

    #  def inspect
    #      @children
    #      @value
    #      @parent
    #  end

end
