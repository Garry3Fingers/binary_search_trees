# frozen_string_literal: true

require_relative 'node'

# This class represents the full tree
class Tree
  attr_reader :array
  attr_accessor :root_node

  def initialize(array)
    @array = array.sort.uniq
    @root_node = nil
  end

  def build_tree(arr = array, first_index = 0, last_index = array.length - 1)
    return nil if first_index > last_index

    middle = (first_index + last_index) / 2
    self.root_node = Node.new(arr[middle], build_tree(arr, first_index, middle - 1),\
                              build_tree(arr, middle + 1, last_index))
    root_node
  end

  def insert(value, root = root_node)
    if root.nil?
      root = Node.new(value)
      root
    end

    if value < root.value
      root.left_child = insert(value, root.left_child)
    elsif value > root.value
      root.right_child = insert(value, root.right_child)
    end
    root
  end

  # This method from https://www.theodinproject.com/lessons/ruby-binary-search-trees
  def pretty_print(node = root_node, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.build_tree
tree.pretty_print
tree.insert(100)
tree.insert(200)
tree.insert(6)
tree.pretty_print
