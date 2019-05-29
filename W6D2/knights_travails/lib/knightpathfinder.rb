require_relative "00_tree_node.rb"
require "byebug"
class KnightPathFinder

    MOVEMENTS = [
        [1,2],
        [1,-2],
        [2,1],
        [2,-1],
        [-1,2],
        [-1,-2],
        [-2,1],
        [-2,-1]
    ]

    attr_reader :considered_positions, :position, :root_pos

    def initialize(position)
        @root_pos, @considered_positions = position, [position]
    end

    def self.valid_moves(pos) 
        possible_moves = []
        MOVEMENTS.each do |movement|
           possible_moves << [pos[0] + movement[0], pos[1] + movement[1]]
        end
        possible_moves.select {|move| move[0] >= 0 && move[0] < 8 && move[1] >= 0 && move[1] < 8}
    end

    def new_move_position(pos)
        all_moves = KnightPathFinder.valid_moves(pos)
        new_moves = all_moves.select{|move| !@considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        
        root = PolyTreeNode.new(root_pos)
        queue = [root]
  
        until queue.empty?
            current_node = queue.shift 
            possible_moves = new_move_position(current_node.value) 
            possible_moves.each do |move| 
                new_node = PolyTreeNode.new(move)
                current_node.add_child(new_node) 
                queue << new_node
            end
        end
        root
    end 

    def find_path(end_pos)
        tree = self.build_move_tree
        target_node = tree.bfs(end_pos)   
        trace_back_path(target_node)
    end

    def trace_back_path(node)
        return [node.value] if node.parent.nil?
        trace_back_path(node.parent) << node.value 
    end

end


