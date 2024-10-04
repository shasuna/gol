require 'pry'
require 'rspec'
require './lib/models/node'

RSpec.describe Node do
  let(:x_dimension) { 2 }
  let(:y_dimension) { 2 }
  let(:node) { Node.new(0, 0, x_dimension, y_dimension) }

  context 'initialization' do
    it 'exists' do
      expect(node).to be_a Node
    end

    it 'can read its coordinate positions' do
      expect(node.x_coordinate).to eq 0
      expect(node.y_coordinate).to eq 0
    end

    context 'neighbor establishment relative to node position on initialization' do
      # We're working in a 3x3 grid

      describe 'node exists in grid corner' do
        it 'has 3 neighbors' do
          expect(node.neighbors.count).to eq 3
          expect(node.neighbors).to include([1, 0], [0, 1], [1, 1])
        end
      end

      describe 'node exists in grid center' do
        it 'has 8 neighbors' do
          node = Node.new(1, 1, x_dimension, y_dimension)
          expect(node.neighbors.count).to eq 8
          expect(node.neighbors).to include([0, 0], [0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1], [2, 2])
        end
      end

      describe 'node exists in grid side' do
        it 'has 5 neighbors' do
          node = Node.new(1, 0, x_dimension, y_dimension)
          expect(node.neighbors.count).to eq 5
          expect(node.neighbors).to include([0, 0], [0, 1], [1, 1], [2, 0], [2, 1])
        end
      end
    end
  end  
end