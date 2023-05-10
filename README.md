# binary_search_trees
I'll build a balanced BST in this assignment without duplicate values.

I need to create:

1. Node class. It should have an attribute for the data it stores as well as its left and right children. It also should include the Comparable module and compare nodes using their data attribute.

2. Tree class which accepts an array when initialized. The Tree class should have a 'root' attribute.

3. #build_tree method which takes an array of data and turns it into a balanced binary tree full of Node objects appropriately placed. The #build_tree method should return the level-0 root node.

4. #insert and #delete method which accepts a value to insert/delete

5. #find method which accepts a value and returns the node with the given value.

6. #level_order method which accepts a block. This method should traverse the tree in breadth-first level order and yield each node to the provided block. The method should return an array of values if no block is given.

7. #inorder, #preorder, and #postorder methods that accepts a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. The method should return an array of values if no block is given.

8. #height method which accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.

9. #depth method which accepts a node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.

10. #balanced? method which checks if the tree is balanced.

11. #rebalance method which rebalances an unbalanced tree.

Then I need to write a simple driver script that does the following:

1. Create a binary search tree from an array of random numbers

2. Confirm that the tree is balanced by calling #balanced?

3. Print out all elements in level, pre, post, and in order

4. Unbalance the tree by adding several numbers > 100

5. Confirm that the tree is unbalanced by calling #balanced?

6. Balance the tree by calling #rebalance

7. Confirm that the tree is balanced by calling #balanced?

8. Print out all elements in level, pre, post, and in order
