require 'spec_helper'
require 'towers'
require 'rspec'

describe TowersOfHanoi do
    subject(:t) {TowersOfHanoi.new}
    describe "#initialize" do 
        it "Should initialize with a 2D array representing stacks" do 
            expect(t.towers.count).to eq(3)
            expect(t.towers[0]).to be_a Array
        end 
        it "The first stack should contain 3 integers representing disks" do
            expect(t.towers[0][0]).to be_a Integer
            expect(t.towers[0].count).to eq(3)
        end
        it "Stacks 2 and 3 should initialize as empty arrays" do
            expect(t.towers[1]).to be_empty
            expect(t.towers[2]).to be_empty
        end
    end
end

