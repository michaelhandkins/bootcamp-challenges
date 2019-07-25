class Stack
    attr_reader :data, :value

    def initialize
        @data = nil
    end

    # Push a value onto the stack
    def push(value)
        @value = value
        print "#{@value} --> #{@data}"
    end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        # I RETURN A VALUE
    end

end

Stack.new
Stack.push(3)
