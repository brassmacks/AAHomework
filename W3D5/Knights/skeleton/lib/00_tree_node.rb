require "byebug"
module Searchable
    def bfs(val)
        que = [self]
        until que.empty? 
            first = que.shift
            return first if val == first.value
            que += first.children
        end
        nil if que.empty?
    end
    
    def dfs(target=nil, &prc)
        raise "Need a proc or target" if [target,prc].none?
        prc ||= Proc.new { |node| node.value == target }

        return self if prc.call(self)

        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end

        nil
    end

    
end
class PolyTreeNode
    include Searchable
    attr_reader :value, :parent, :children
    def initialize(value, parent=nil)
        @value = value
        @parent = parent
        @children = []
    end

    def inspect
        @value.inspect
    end

    def add_child(node)
        unless node == nil 
            unless self.children.include?(node)
                self.children << node
                node.parent=self
            end
        end

    end

    def parent=(node)
        unless node == nil || self.parent == node
            self.parent.children.delete(self) unless @parent == nil
            unless node.children.include?(self)
                node.add_child(self)
            end
        end
            @parent = node
        #self.parent = nil if node == nil
    end

    def remove_child(node)
        unless self.children.include?(node)
            raise "passed node is not a child of node instance"
        end
        node.parent=nil 
    end



 
end