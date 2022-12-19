class Tree
    attr_reader :children, :node_name

    def initialize(name, childrenHash)
        @node_name = name
        @children = childrenHash.keys.map {|key| Tree.new(key, childrenHash[key])}
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end


tree = Tree.new("Ruby", {:test => {:child1 => {}, :child2 => {:grandchuld => {}}}})
puts "Visiting a node"
tree.visit {|node| puts node.node_name}

puts ''
puts "Visiting a tree"
tree.visit_all {|node| puts node.node_name}