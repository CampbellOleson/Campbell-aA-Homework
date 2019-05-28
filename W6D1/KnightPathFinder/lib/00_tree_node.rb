require 'byebug'

class PolyTreeNode
   
    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value = nil)
        @children = []
        @parent = nil #=> node.children => [children]
        @value = value
    end

    def parent=(new_node) 

        #parent=(marshal)

        @parent = new_node

        if !self.parent.nil?
        self.parent.children.delete(self) 
        end

    #       1
    #      / \
    #  []2   3
    #    /   / \
    #     [4]5   6
    #      /
     #    4

        #delete node from old parents 

        new_node.children << self if !new_node.nil? && !new_node.children.include?(self)

    end

# self = marshal.add_child
# child = jimmy
# marshals kids = [jimmy]
# jimmy.parent = marshal

    def add_child(child)
        @children << child
        child.parent = self
    end

    def remove_child(child) #
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

    #       1
    #      / \
    #     2   3
    #    /   / \
    #   4   5   6
    #  
    # 


    def bfs(target)
    queue = [self]
    # debugger
        until queue.empty?
            # queue << self.children 
            queue[0].children.each {|child|queue << child}
            return queue[0] if queue[0].value == target
            queue.shift
        end
        nil 
    end

    
    #       1
    #      / \
    #     2   3
    #    /   / \
    #   4   5   6
    #  /   / \
    # 7   8   9
    ###
    #[]

    # def inspect
    #     @children.inspect
    #     @value.inspect
    #     @parent.inspect
    # end

end

# queue = [node]
# until? queue.empty? do |ele|
#   queue << ele.children
#   return ele if ele.value == target
#   queue.shift
# end
# nil 

#end


[5,6,7]