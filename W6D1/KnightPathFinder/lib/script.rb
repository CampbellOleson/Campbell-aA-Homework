require_relative "searchable.rb"
require_relative "00_tree_node.rb"
load 'lib/searchable.rb'
load "lib/00_tree_node.rb"

node = PolyTreeNode.new
child1 = PolyTreeNode.new(9)
child2 = PolyTreeNode.new(1)
child3 = PolyTreeNode.new(5)
searchable = Searchable.new
node.children << child1
node.children << child2
node.children << child3
