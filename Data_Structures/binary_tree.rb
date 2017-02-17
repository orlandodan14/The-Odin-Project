class Node
  attr_accessor :value, :parent, :left, :right, :num_node
  def initialize(value, num)
    @value = value
    @num_node = num
    @parent = parent
    @left = left
    @right = right
  end
end

class Tree
  attr_accessor :root
  def initialize
    @root = nil
  end     
  
  def build_tree(array, values = [])
    array = array.uniq
    @array_size = array.size
    i = 1
    @root = Node.new(array[0], i)
    #puts "A node with value #{array[0]} was created."
    root = @root
    values << array[0]
    while i < array.size
      if !values.include?(array[i])
        values << array[i]
        newnode = Node.new(array[i], values.size)
        #puts "A node with value #{array[i]} was created."
        comp(root, newnode)
        i += 1
      end
    end
  end
  
  def comp(root, newnode)
    if newnode.value > root.value && root.right.nil?
      root.right = newnode
      newnode.parent = root
    elsif newnode.value > root.value && !root.right.nil?
      root = root.right
      comp(root, newnode)
    elsif newnode.value < root.value && root.left.nil?
      root.left = newnode
      newnode.parent = root
    elsif newnode.value < root.value && !root.left.nil?
      root = root.left
      comp(root, newnode)
    end
  end
  
  def view_tree(node = @root)
    c = node.value
    n = node.num_node == nil ? "nil" : node.num_node
    p = node.parent == nil ? "nil" : node.parent.value
    l = node.left == nil ? "nil" : node.left.value
    r = node.right == nil ? "nil" : node.right.value
    puts "Node #{n}: Value: #{c} | Left: #{l} | Right: #{r} | Parent: #{p}" 
    view_tree(node.left) if node.left != nil
    view_tree(node.right) if node.right != nil
  end
  
  def breadth_first_search(item, node = @root, result = [], queue = [])
    if !result.include?(node.value)
      result << node.value
    end    
    if item == node.value
      puts "BFS: Your item \"#{item}\" was found in Node \"#{node.num_node}\", with the position \"#{result.size}\", #{result}"
    else
      if !node.left.nil?
          result << node.left.value
        if node.left.value == item
          puts "BFS: Your item \"#{item}\" was found in Node \"#{node.left.num_node}\", with the position \"#{result.size}\", #{result}"
        end
        queue << node.left
      end
      if !node.right.nil?
          result << node.right.value
        if node.right.value == item
          puts "BFS: Your item \"#{item}\" was found in Node \"#{node.right.num_node}\", with the position \"#{result.size}\", #{result}"
        end     
        queue << node.right
      end
    end
    if node.left == nil && node.right == nil
      puts "BFS: Your item \"#{item}\" was not found."
      result << item
    end
    if !result.include?(item)
      node = queue.shift
      breadth_first_search(item, node, result, queue)
    end
  end
  
  def depth_first_search(item, node = @root, result = [], stack = [])
    stack << node if result.length == 0
    result << node.value if !result.include?(node.value)
    if item == node.value
      puts "DFS-DLR: Your item \"#{item}\" was found in Node \"#{node.num_node}\", with the position \"#{result.size}\", #{result}"
    else
      if !node.left.nil? && !result.include?(node.left.value)
        stack << node.left
        depth_first_search(item, node.left, result, stack)
      else
        if !node.right.nil?
          stack << node.right
          depth_first_search(item, node.right, result, stack)
        else
          if stack.length == 0
            puts "DFS-DLR: Your item \"#{item}\" was not found."
          else
            node = stack.pop
            depth_first_search(item, node, result, stack)
          end
        end
      end
    end
  end
  
  def dfs_rec(item, node = @root, result = [])
    if node.nil?
      puts "DFS-DLR-REC: Your item \"#{item}\" nas not found."
    else
      result << node.value if !result.include?(node.value)
      if item == node.value
        puts "DFS-DLR-REC: Your item \"#{item}\" was found in Node \"#{node.num_node}\", with the position \"#{result.size}\", #{result}"
      else
        if !node.left.nil? && !result.include?(node.left.value)
          dfs_rec(item, node.left, result)
        else
          if !node.right.nil? && !result.include?(node.right.value)
            dfs_rec(item, node.right, result)
          else
            node = node.parent
            dfs_rec(item, node, result)
          end
        end
      end
    end    
  end
end


array = [9, 67,  23, 8, 6345, 5, 7, 4, 324, 3, 2, 13]
tree = Tree.new()
tree.build_tree(array)
tree.root
tree.view_tree
tree.breadth_first_search(3)
tree.breadth_first_search(4000)
tree.depth_first_search(23)
tree.depth_first_search(4000)
tree.dfs_rec(2)
tree.dfs_rec(13)
tree.dfs_rec(1000)