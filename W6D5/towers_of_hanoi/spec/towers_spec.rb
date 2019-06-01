require 'towers'
require 'rspec'

describe Disk do 
    subject(:disk) {Disk.new(5)}
    describe "#initialize" do 
        it "Should initialize Disk with an integer representing size" do
            expect(disk.size).to eq(5)
        end
    end
end

describe Peg do 
    subject(:peg) {Peg.new}
    describe "#initialize" do 
        context "When no array is passed in" do
            it "Should initialize with an empty array by default" do 
                expect(peg.disks).to be_empty
            end
        end

    context "When an array is passed in" do
        let(:peg) {Peg.new([4,3,2,1])}
        it "Should initialize with the array" do 
            expect(peg.disks.count).to eq(4)
        end
        
        it "Should initialize the array with instances of disks" do 
            expect(peg.disks.all?).to be_a(Disk)
        end

    end
end
end



RSpec.configure do |config|
    config.color = true
end
  
