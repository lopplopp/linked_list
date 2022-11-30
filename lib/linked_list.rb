class LinkedList
    def initialize(node = nil)
        @head = node
    end

    def append(value)
        pointer = @head
        pointer = pointer.next_node until pointer.next_node.nil?
        pointer.next_node = Node.new(value)
    end

    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
    end

    def size
        size = 0
        pointer = @head
        until pointer.nil?
            size+=1
            pointer = pointer.next_node
        end
        size
    end

    def head
        @head
    end

    def tail
        pointer = @head
        pointer = pointer.next_node until pointer.next_node.nil?
    end

    def at(index)
        return nil if @head.nil? || index + 1 > size
        current_index = 0
        pointer = @head
        until current_index == index
            pointer = pointer.next_node
            current_index += 1
        end
        pointer
    end

    def pop
        current = @head
        until (current.next_node.nil?)
            previous = current
            current = current.next_node
        end
        previous.next_node = nil
        current
    end

    def contains?(value)
        contain = false
        pointer = @head
        until pointer.nil?
            contain = true if pointer.value == value
            pointer = pointer.next_node
        end
        contain
    end

    def find(value)
        pointer = @head
        index = 0
        until pointer.nil?
            break if pointer.value == value
            pointer = pointer.next_node
            index += 1                
        end
        index
    end

    def to_s
        string = ""
        pointer = @head
        until pointer.nil?
            string += "(#{pointer.value}) -> "
            pointer = pointer.next_node
        end
        string += "nil"
    end

    def insert_at(value, index)
        if index == 0
            node = Node.new(value, @head)
            @head = node
            return
        end
        current = @head
        current_index = 0
        until (current_index == index)
            append(nil) if current.next_node.nil?
            previous = current
            current = current.next_node
            current_index += 1
        end
        previous.next_node = Node.new(value, current)
    end

    def remove_at(index)
        return @head = @head.next_node if index == 0
        current_index = 0
        current = @head
        until (current_index == index)
            previous = current 
            current = current.next_node
            current_index += 1
        end
        previous.next_node = current.next_node
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
end