=begin
Write your code for the 'Linked List' exercise in this file. Make the tests in
`linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/linked-list` directory.
=end

class Deque
    
    def initialize
        @head = nil
        @tail = nil
    end
  
    def push(v)
        if @tail == nil
            @head = Node.new(v)
            @tail = @head
        else
            n = Node.new(v, @tail)
            @tail.next = n
            @tail = n
        end
    end
  
    def pop
        out = @tail
        @tail = out.prev
        out.value
    end
  
    def unshift(v)
        if @head == nil
            @head = Node.new(v)
            @tail = @head
        else
            n = Node.new(v, nil, @head)
            @head.prev = n
            @head = n
        end
    end
  
    def shift
        out = @head
        @head = out.next
        out.value
    end
    
end
  
class Node

    attr_accessor :value, :prev, :next
  
    def initialize(v, p = nil, n = nil)
        @value = v
        @prev  = p
        @next  = n
    end

end