require 'rspec'
require 'spec_helper'
require 'file'

describe Array do
  
    subject(:arr) {[1,-2,1,2,4,-4,4,5,3]}
    let(:_arr) {[[1,2],[3,4]]}
    let(:stocks) {[10, 5, 3, 7, 1, 2]}

    describe "#my_uniq" do
    
        it "Should return unique elements in the order the appear in original array" do
            expect(arr.my_uniq).to eq([1,-2,2,4,-4,5,3])   
        end
    end

    describe "#two_sum" do
        it "finds all pairs of positions where the elements at those positions sum to zero" do
           expect(arr.two_sum).to eq([[1,3],[4,5],[5,6]])
        end
    end

    describe "#my_transpose" do 
        it 'should transpose the array' do
            expect(_arr.my_transpose).to eq([[1,3],[2,4]])
        end
    end

    describe "#stock_picker" do
        it "should return the most profitable pair days" do
            expect(stocks.stock_picker).to eq([2,3])
        end
    end
end
