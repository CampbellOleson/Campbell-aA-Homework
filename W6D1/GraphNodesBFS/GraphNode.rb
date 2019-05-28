class GraphNode
    attr_accessor :neighbors, :value
    def initialize(val)
        self.neighbors = []
        self.value = val
    end

    def self.bfs(starting_node, target)
        return starting_node if starting_node.value == target
        queue = [starting_node]
        visited = Set.new

        until queue.empty?
            node = queue.shift
            unless visited.include?(node)
                return node if node.value == target
                visited.add(node)
                queue += node.neighbors
            end
        end
        return nil
    end

    # def self.dfs(graph)
    #     visited = Set.new(starting_node)

    #     graph.keys.each do |node|
    #         _dfs_(node,target)
    #     end
    #     nil
    # end

    # def _dfs_(node,target)
    #     return nil if node.neighbors.empty?



    # end

end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
