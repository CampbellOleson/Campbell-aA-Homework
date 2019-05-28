class Searchable
    attr_accessor :nodes
        def initialize #needed? how do we refer to instances of nodes?
            @nodes = []
        end
    
        def dfs(target) #starting point is an array of nodes?
    
            # @nodes.each do |node| #[1,2,3,4] target = 3
                return node if node.value == target
                search_result = node.dfs(target)
                
                return search_result if !search_result.nil?
            # end 
        end
    end

 def dfs(target) #starting point is an array of nodes?
        return self.nodes if self.nodes.value == target
        self.nodes.children.each do |child|
            search_result = child.dfs(target)
            # return search_result unless search_result.nil?
            return nil if search_result.nil?
            search_result
        end
    end 

#nodes.each do |index|
#   search_results = dfs(target)
#   if index.value == target
#       return index
      
#       search_results = dfs(target)