
module LinkedListHelper

  class << self
    def length_of(node)
      length = 0
      while node
        node = node.next
        length += 1
      end
      length
    end

    def contents_match?(node, collection)
      collection.each do |element|
        return false if node.nil? && element
        return false unless node.data == element
        node = node.next
      end
      true
    end

    def advance_n_nodes(n, node)
      nodes_traversed = 0
      while node && nodes_traversed < n
        node = node.next
        nodes_traversed += 1
      end
      nodes_traversed == n ? node : nil
    end

    def nth_to_last_node(n, root)
      follower = root
      leader   = advance_n_nodes(n - 1, root)

      return nil unless leader

      while leader.next
        follower = follower.next
        leader   = leader.next
      end

      follower
    end

    def node_removed?(list, original_length, index, data)
      original_length - 1 == length_of(list) &&
        data == advance_n_nodes(index, list).data
    end

    def partitioned_correctly?(list, pivot_value)
      while list
        pivot_encountered ||= list.data >= pivot_value
        if pivot_encountered
          return false unless list.data >= pivot_value
        else
          return false unless list.data < pivot_value
        end
        list = list.next
      end
      true
    end
  end

end

RSpec.configure do |config|
  config.include LinkedListHelper
end
