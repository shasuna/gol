require 'pry'
require 'rspec'
require './lib/models/grid'
require './lib/models/node'


RSpec.describe Grid do
  let(:grid) { Grid.new(3, 3) }

  context 'initialization' do
    it 'exists' do
      expect(grid).to be_a Grid
    end

    context 'node setup' do
      it 'setups correct amount of rows' do
        expect(grid.nodes.count).to eq 3
      end

      it 'sets up correct amount of nodes per row' do
        expect(grid.nodes[0].count).to eq 3
        expect(grid.nodes[1].count).to eq 3
        expect(grid.nodes[2].count).to eq 3
      end
    end
  end
end