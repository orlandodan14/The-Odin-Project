class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @last_node = nil
    @size = 0
  end
  
  def append(value)
    new_node = Node.new(value)
    @size += 1
    if @head.nil? && @tail.nil?
      @head = @tail = @last_node = new_node
      @last_node.next_node = nil
      puts "'#{value}' was added in the LAST node and the new list size is: #{@size}"
    else
      @last_node.next_node = new_node
      @last_node = new_node
      @last_node.next_node = nil
      puts "'#{value}' was added in the LAST node and the new list size is: #{@size}"
    end
  end
  
  def prepend(value)
    new_node = Node.new(value)
    @size += 1
    if @head.nil? && @tail.nil?
      @head = @tail = @last_node = new_node
      @head.next_node = @tail
      puts "'#{value}' was added in the HEAD node and the new list size is: #{@size}"
    else
      @last_node.next_node = @last_node
      @tail = @head
      @head = new_node
      @head.next_node = @tail
      @tail = @head.next_node
      @last_node.next_node = nil
      puts "'#{value}' was added in the HEAD node and the new list size is: #{@size}"
    end
  end
  
  def size
    @size
  end
  
  def head
    @head
    puts "The HEAD of the list has a value of: '#{@head.value}'"
  end
  
  def tail
    @last_node
    puts "The LAST NODE of the list has a value of: '#{@last_node.value}'"
  end
  
  def pop
    puts "'#{@last_node.value}' was removed."
    @size -= 1
    @last_node = at(@size)
    @last_node.next_node = nil
  end
  
  def at(index)
    position = 1
    node = @head
    while position != index
      node = node.next_node
      position += 1
    end
    return node
  end
  
  def contains?(val)
    position = 1
    node = @head
    until position == @size
      return true if node.value == val
      node = node.next_node
      position += 1
    end
    return false
  end
  
  def find(data)
    position = 1
    node = @head
    until position == @size
      return position if node.value == data
      node = node.next_node
      position += 1
    end
    return nil
  end
  
  def to_s
    list = ""
    position = 0
    node = @head
    until position == @size
      list << "( #{node.value} ) -> "
      node = node.next_node
      position += 1
    end
    list << "nil."
    print "New list is:", list, "\n"
  end
  
  def insert_at(index, val)
    new_node = Node.new(val)
    previous_node = at(index - 1)
    new_node.next_node = previous_node.next_node
    previous_node.next_node = new_node
    @size += 1
    puts "'#{val}' was added in position #{index} and the new size of the list is #{@size}."
  end
  
  def remove_at(index)
    if index == 1
      @size -= 1
      node = at(1)
      puts "'Node #{index}' with a value of: '#{node.value}' was removed and the new size of the list is #{@size}."
      @head = node.next_node
      node = nil
    else
      previous_node = at(index - 1)
      node = at(index)
      previous_node.next_node = node.next_node
      @size -= 1
      puts "'Node #{index}' with a value of: '#{node.value}' was removed and the new size of the list is #{@size}."
      node = nil
    end
    
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
    @next_node = nil
  end
end


nodes = LinkedList.new

nodes.append('w')
nodes.head
nodes.to_s
nodes.append('x')
nodes.head
nodes.append('y')
nodes.head
nodes.to_s
nodes.append('z')
nodes.head
nodes.prepend('d')
nodes.head
nodes.to_s
nodes.prepend('c')
nodes.head
nodes.prepend('b')
nodes.head
nodes.to_s
nodes.prepend('a')
nodes.head
nodes.tail
nodes.to_s
nodes.pop
nodes.tail
nodes.to_s
nodes.pop
nodes.tail
nodes.to_s
nodes.at(2)
nodes.at(4)
puts nodes.contains?('b')
puts nodes.contains?('f')
nodes.to_s
nodes.insert_at(4, 't')
nodes.at(4)
nodes.at(5)
nodes.to_s
nodes.insert_at(2, 'q')
nodes.at(2)
nodes.at(3)
nodes.to_s
nodes.remove_at(3)
nodes.to_s
nodes.remove_at(5)
nodes.to_s
nodes.insert_at(2, 'm')
nodes.to_s
nodes.remove_at(1)
nodes.to_s
nodes.remove_at(6)
nodes.to_s

