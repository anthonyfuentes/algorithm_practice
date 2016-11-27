
require 'linked_list_files'
require 'linked_list_helper'

describe "LinkedList" do
  include LinkedListHelper

  describe '#create_n_length_list' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'does not create a list when passed 0' do
      list = create_n_length_list(0)
      expect(list).to be_nil
    end

    it 'creates a list one node long when passed 1' do
      length = 1
      list   = create_n_length_list(length)
      actual_length = LinkedListHelper.length_of(list)
      expect(actual_length).to eq(length)
    end

    it 'creates a list many nodes long when passed n > 1' do
      length = 8
      list   = create_n_length_list(length)
      actual_length = LinkedListHelper.length_of(list)
      expect(actual_length).to eq(length)
    end
  end

  describe '#create_list_from' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'does not create a list if passed an empty collection' do
      array, hash = [], {}
      array_list, hash_list = create_list_from(array), create_list_from(hash)
      expect(array_list).to be_nil
      expect(hash_list).to be_nil
    end

    it 'creates a linked list from an array w/ elements in given order' do
      array = ['x', 'y', 3, /r/]
      list  = create_list_from(array)
      contents_match = LinkedListHelper.contents_match?(list, array)
      expect(contents_match).to be true
    end

    it 'creates a linked list from a hash' do
      hash = { a: 1, b: 2, c: 3 }
      list = create_list_from(hash)
      contents_match = LinkedListHelper.contents_match?(list, hash)
      expect(contents_match).to be true
    end
  end

  describe '#advance_n_nodes' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'does not advance if n is less than 1' do
      list = create_n_length_list(1)
      node = advance_n_nodes(0, list)
      expect(node).to eq(list)
    end

    it 'advances n nodes forward from the given node when n >= 1' do
      length = 3
      list   = create_n_length_list(length)
      length.times do |distance|
        node = advance_n_nodes(distance, list)
        actual_node = LinkedListHelper.advance_n_nodes(distance, list)
        expect(node).to eq(actual_node)
      end
    end
  end

  describe '#nth_to_last_node' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'returns nil if list is shorter than n' do
      length = 3
      list   = create_n_length_list(length)
      node   = nth_to_last_node(length + 1, list)
      expect(node).to be_nil
    end

    it 'returns the nth to last node' do
      length = 5
      list   = create_n_length_list(length)
      length.downto(1) do |nth_to_last_position|
        actual_node   = nth_to_last_node(nth_to_last_position, list)
        expected_node = LinkedListHelper.nth_to_last_node(nth_to_last_position, list)
        expect(actual_node).to eq(expected_node)
      end
    end
  end

  describe '#remove_given_node' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'removes the given node from the list' do
      numbers = [1, 2, 3]
      list    = create_list_from(numbers)
      index, data  = 1, list.next.next.data
      remove_given_node(list.next)
      node_removed = LinkedListHelper.node_removed?(list, numbers.length, index, data)
      expect(node_removed).to be true
    end

    it 'returns nil if the given node is the last in the list' do
      list = create_n_length_list(2)
      expect(remove_given_node(list.next)).to be_nil
    end
  end

  describe '#partition_list' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'partitions list around x such that data < than x come before all data >= x' do
      numbers = [77, 2, 9, -9, 0, 0, 55, -876, 8.1, 7.9]
      list    = create_list_from(numbers)
      pivot   = 8
      partition_list(list, pivot)
      partitioned_correctly = LinkedListHelper.partitioned_correctly?(list, pivot)
      expect(partitioned_correctly).to be true
    end

    it 'does not change node order if pivot value less than all list data' do
      numbers = [77, 2, 9, -9, 0, 0, 55, -876, 8.1, 7.9]
      list    = create_list_from(numbers)
      partition_list(list, -1000)
      partitioned_correctly = LinkedListHelper.contents_match?(list, numbers)
      expect(partitioned_correctly).to be true
    end

    it 'does not change node order if no values less than pivot value' do
      numbers = [77, 2, 9, 0, 0, 55, 876, 8.1, 7.9]
      list    = create_list_from(numbers)
      partition_list(list, 0)
      partitioned_correctly = LinkedListHelper.contents_match?(list, numbers)
      expect(partitioned_correctly).to be true
    end
  end

  describe '#sum_lists' do
    # delete the before statement below when you're ready for these tests
    before { skip }

    it 'sums two lists representing numbers in reverse order' do
      ninety_four   = create_list_from([4, 9])
      two_fifty_one = create_list_from([1, 5, 2])
      sum_list      = sum_lists(ninety_four, two_fifty_one)
      sum_array     = [5, 4, 3]
      summed_correctly = LinkedListHelper.contents_match?(sum_list, sum_array)
      expect(summed_correctly).to be true
    end
  end
end
