
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end


class MyStack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end



class StackQueue
  def initialize
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
  end

  def size
    @enqueue_stack.size + @dequeue_stack.size
  end

  def empty?
  end

  def enqueue(el)
    until @dequeue_stack.empty?
      @enqueue_stack.push(@dequeue_stack.pop)
    end
    @enqueue_stack.push(el)
  end

  def dequeue
    until @enqueue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop)
    end
    @dequeue_stack.pop
  end
end


class MinMaxStack < MyStack
  attr_reader :max, :min
  def push(el)
    @store << el
    if el > @max
      @max = el
    elsif el < @min
      @min = el
    end
  end


end
