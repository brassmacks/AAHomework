class Map

    def initialize
        pairs = []
    end

    def set(key, value)
        pairs << [key, value]
    end

    def get(key)
        pairs.each do |pair|
            return pair if pair[0] == key
        end
    end

    def delete(key)
        pairs.each_with_index do |pair, i|
            pairs[i].delete if pair[0] == key
        end
    end

    def show(key)
        pairs.each { |pair| return pair[1] if pair[0] == key }
    end
    def set(key, value)
        pairs.each do |pair|
            if pair[0] == key
                pair[1] == new_value
                return pair
            end
        end
        pairs << [key, value]
    end
    
end