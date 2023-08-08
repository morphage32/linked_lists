class LinkedList
  attr_reader :head, :tail
  def initialize()
  @head
  @tail
  @current
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @current = @head
      until @current.next_node.nil?
        @current = @current.next_node
      end

      @current.next_node = Node.new(value)
      @tail = @current.next_node
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @current = Node.new(value)
      @current.next_node = @head
      if @head.next_node.nil?
        @tail = @head
      end
      @head = @current
    end
  end

  def size()
    list_size = 0
    if @head.nil?
      return list_size
    else
      @current = @head

      until @current.nil?
        list_size += 1
        @current = @current.next_node
      end
    end

    return list_size
  end

  def at(index)
    @current = @head
    i = 0
    until i > index
      if @current.nil?
        return nil
      elsif i == index
        return @current
      end

      @current = @current.next_node
      i += 1
    end

    return nil
  end

  def pop()
    if @head.nil?
      puts "List is empty."
      return
    end

    until @current.next_node == @tail
      @current = @current.next_node
    end

    popped_node = @tail
    @tail = @current
    @tail.next_node = nil
    return popped_node
  end

  def contains?(value)
    if @head.nil?
      return false
    end

    @current = @head

    until @current.nil?
      if @current.value == value
        return true
      end

      @current = @current.next_node
    end

    return false
  end

  def find(value)
    if @head.nil?
      return nil
    end

    @current = @head
    index = 0

    until @current.nil?
      if @current.value == value
        return index
      end

      index += 1
      @current = @current.next_node
    end

    return nil
  end

  def to_s()
    @current = @head
    until @current.nil?
      print "( #{@current.value} )"
      unless @current.next_node.nil?
        print " -> "
      end

      @current = @current.next_node
    end
    puts
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(v)
    @value = v
    @next_node
  end
end

my_list = LinkedList.new()

my_list.append(1)
my_list.append(3)
my_list.append(5)
my_list.prepend(6)
my_list.prepend(4)
my_list.prepend(2)

my_list.to_s

puts "Size of my_list: #{my_list.size}"
puts "First node: #{my_list.head.value}"
puts "Last node: #{my_list.tail.value}"
puts "Node at index 3 is: #{my_list.at(3).value}"
puts "Pop function returns: #{my_list.pop.value}"

my_list.to_s

puts "contains?(5) returns: #{my_list.contains?(5)}"
puts "contains?(3) returns: #{my_list.contains?(3)}"
puts "index of the number 4 is: #{my_list.find(4)}"