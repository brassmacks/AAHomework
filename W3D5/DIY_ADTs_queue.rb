class Queue
    def initialize
        @ivar = []
    end

        def push(el)
        ivar << el
    end

    def shift
        ivar.shift
    end

    def peek
        puts ivar[-1]
    end

end
