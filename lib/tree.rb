# frozen_string_literal: true

require_relative 'node'

# This class represents the full tree
class Tree
  attr_reader :array, :root_node

  def initialize(array)
    @array = array
    @root_node = nil
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree
