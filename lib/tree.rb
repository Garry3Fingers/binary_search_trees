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

  def build_tree(arr = array, first_index = 0, last_index = arr.length - 1)
    return nil if first_index > last_index

    middle = (first_index + last_index) / 2
    self.root_node = create_node(arr[middle], build_tree(arr, first_index, middle - 1),\
                                 build_tree(arr, middle + 1, last_index))
    root_node
  end

  def insert(value, root = root_node)
    return root = create_node(value) if root.nil?

    root.left_child = insert(value, root.left_child) if value < root.value
    root.right_child = insert(value, root.right_child) if value > root.value
    root
  end

  def delete(value, root = root_node)
    return nil if root.nil? || root.left_child.nil? && root.right_child.nil?

    if root.value > value
      root.left_child = delete(value, root.left_child)
      return root
    elsif root.value < value
      root.right_child = delete(value, root.right_child)
      return root
    end

    delete_help_with_one_child(root)

    delete_help_with_2_children(root)
  end

  def find(value, root = root_node)
    return 'This value doesn\'t exist in the tree' if root.nil?
    return root if root.value == value
    return find(value, root.left_child) if value < root.value
    return find(value, root.right_child) if value > root.value
  end

  def level_order(root = root_node, array = [])
    queue = [root]
    until queue.empty?
      current = queue.shift
      block_given? ? yield(current) : array.push(current.value)
      queue.push(current.left_child) unless current.left_child.nil?
      queue.push(current.right_child) unless current.right_child.nil?
    end

    array unless array.empty?
  end

  def preorder(root = root_node, arr = [], &block)
    block_given? ? block.call(root) : arr.push(root.value)

    preorder(root.left_child, arr, &block) unless root.left_child.nil?
    preorder(root.right_child, arr, &block) unless root.right_child.nil?
    arr unless arr.empty?
  end

  def inorder(root = root_node, arr = [], &block)
    inorder(root.left_child, arr, &block) unless root.left_child.nil?

    block_given? ? block.call(root) : arr.push(root.value)

    inorder(root.right_child, arr, &block) unless root.right_child.nil?
    arr unless arr.empty?
  end

  def postorder(root = root_node, arr = [], &block)
    postorder(root.left_child, arr, &block) unless root.left_child.nil?
    postorder(root.right_child, arr, &block) unless root.right_child.nil?

    block_given? ? block.call(root) : arr.push(root.value)

    arr unless arr.empty?
  end

  def height(node)
    return -1 if node.nil?

    [height(node.left_child), height(node.right_child)].max + 1
  end

  def depth(node, root = root_node)
    return -1 if root.nil?

    depth = -1
    return depth + 1 if root.value == node.value

    depth = depth(node, root.left_child)
    return depth + 1 if depth >= 0

    depth = depth(node, root.right_child)
    return depth + 1 if depth >= 0

    depth
  end

  def balanced?
    root = root_node
    difference = height(find(root.left_child.value)) - height(find(root.right_child.value))

    case difference
    in 0 | 1 | -1
      true
    else false
    end
  end

  def rebalance
    build_tree(inorder)
  end

  # This method from https://www.theodinproject.com/lessons/ruby-binary-search-trees
  def pretty_print(node = root_node, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  private

  def create_node(value, *args)
    Node.new(value, *args)
  end

  def delete_help_with_one_child(root)
    root.right_child if root.left_child.nil?
    root.left_child if  root.right_child.nil?
  end

  def delete_help_with_2_children(root)
    successor_parent = root
    successor = root.right_child

    until successor.left_child.nil?
      successor_parent = successor
      successor = successor.left_child
    end

    successor_parent.left_child = successor.right_child if successor_parent != root
    successor_parent.right_child = successor.right_child if successor_parent == root

    root.value = successor.value
    root
  end
end
