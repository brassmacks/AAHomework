class LRUCache
    def initialize(size=1)
        @size = size
        @cache = Array.new(size) { Array.new }
    end

    def count
        list = bin_compiler
        list.length 
    end

    def add(inclusion)
        list = bin_compiler
        open_slot = first_empty
        if list.include?(inclusion)
            remove(inclusion)
        end
        @cache[open_slot] << inclusion
        re_hash if too_dense? 
    end
    
    def show
        bin_compiler
    end

    private
    def remove(inclusion)
        @cache.each do |bucket|
            bucket.delete(inclusion)
        end
    end

    def first_empty
        i = 0
        until count == @cache.length
            return count if @cache[count].empty?
        end
        re_hash
    end

    def bin_compiler
        list = []
        @cache.each { |bucket| list += bucket unless bucket.empty? }    
        list
    end

    def re_hash
        if too_dense?
            @size *= 2
            list = bin_compiler
            @cache = Array.new(@size) { Array.new }
            i = 0
            until list.empty?
                @cache[count] << list.shift
                i += 1
            end
        end
    end

    def too_dense?
        return true if count == @size
    end
end