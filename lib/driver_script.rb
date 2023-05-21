# frozen_string_literal: true

require_relative 'tree'

def print_level_order(tree_name, &block)
  puts 'Lever order:'
  tree_name.level_order(&block)
  puts ''
end

def print_preorder(tree_name, &block)
  puts 'Preorder:'
  tree_name.preorder(&block)
  puts ''
end

def print_inorder(tree_name, &block)
  puts 'Inorder:'
  tree_name.inorder(&block)
  puts ''
end

def print_postorder(tree_name, &block)
  puts 'Postorder:'
  tree_name.postorder(&block)
  puts ''
end

def print_nodes(tree_name, &block)
  print_level_order(tree_name, &block)
  print_preorder(tree_name, &block)
  print_inorder(tree_name, &block)
  print_postorder(tree_name, &block)
end

def balanced?(tree_name)
  "Is the binary tree balanced? #{tree_name.balanced?}"
end

arr = Array.new(15) { rand(1..100) }
binary_tree = Tree.new(arr)
binary_tree.build_tree
binary_tree.pretty_print
puts balanced?(binary_tree)
print_nodes(binary_tree) { |node| print "#{node.value} " }
binary_tree.insert(100)
binary_tree.insert(200)
binary_tree.insert(300)
binary_tree.insert(400)
binary_tree.pretty_print
puts balanced?(binary_tree)
binary_tree.rebalance
binary_tree.pretty_print
puts balanced?(binary_tree)
print_nodes(binary_tree) { |node| print "#{node.value} " }
