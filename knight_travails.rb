class Node
    attr_accessor :data, :previous_node
  def initialize(move, previous_node)
    @previous_node = previous_node
    @data = move
  end
end

def knight_travails(start, destination, node = Node.new(start, nil), queue = [node])
    return trace_path(node) if node.data == destination

    legal_moves = [
        [(node.data[0] + 2), (node.data[1] + 1)], 
        [(node.data[0] + 2), (node.data[1] - 1)], 
        [(node.data[0] + 1), (node.data[1] + 2)], 
        [(node.data[0] - 1), (node.data[1] + 2)],
        [(node.data[0] - 2), (node.data[1] + 1)],
        [(node.data[0] - 2), (node.data[1] - 1)],
        [(node.data[0] - 1), (node.data[1] - 2)],
        [(node.data[0] + 1), (node.data[1] - 2)]  
].select { |moves| moves.all? { |num| num >= 0 && num <= 7} }

queue.shift

legal_moves.each { |data| queue << Node.new(data, node) }

knight_travails(start, destination, queue[0], queue)

end

def trace_path(node, path = [])
  path << node.data
  if node.previous_node == nil
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.reverse.each do |move|
        p move
    end
    return
  end
  trace_path(node.previous_node, path)  
end

knight_travails([3,3], [4,3])