require_relative "KnodePath.rb"
require "byebug"
class KnightPathFinder 
    KNIGHT_MOVES = [[1,-2],[2,-1],[2,1],[1,2],[-1,2][-2,1],[-2,-1],[-1,-2]]
    def initialize(start_pos)
        @board = Array.new(8) {Array.new(8, "-")}
        @cur_pos = start_pos
        
    end

    def find_path(goal)
        start = KnodePath.new(@cur_pos)
        steps = []
        until steps.include?(goal)
            tree = [start]
            cur_node = tree.shift
            KNIGHT_MOVES.each do |move|
                spot = cur_node.value
                debugger

                cur_move = [(spot[0] + move[0]), (spot[1] + move[1])]
                if valid?(cur_move)
                    steps << cur_move
                    nxt = KnodePath.new(cur_move, start)
                    cur_node.add_child(nxt)
                end
            end 
            tree += cur_node.children
        end
    print steps
    end

    def valid?(pos)
        return false if pos.any? { |cord| cord > 7 || cord < 0 }
        true
    end

    def [](pos)
        row, col = pos[0], pos[1]
        @board[row][col]
    end
    
    def []=(pos, value)
        row, col = pos[0], pos[1]
        @board[row][col] = value
    end    

    def place_knight(pos)
        @board[pos] = "k"
        @board[cur_pos] =  "0"
        cur_pos = pos
    end


end

this = KnightPathFinder.new([0,3])

this.find_path([2,1])