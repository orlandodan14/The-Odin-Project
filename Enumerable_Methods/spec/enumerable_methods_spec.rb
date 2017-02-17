require 'enumerable_methods'

describe "Enumerable" do
  before :all do
    @array = [1,2,3]
  end
  
  describe "#my_each" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_each).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        empty_array= []
        expect(@array.my_each { |item| empty_array << (item + 1) }).to eql(@array)
        expect(empty_array).to eql([2,3,4])
      end
    end
  end
  
  describe "#my_each_with_index" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_each_with_index).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        empty_array = []
        expect(@array.my_each_with_index { |item, index| empty_array << "In #{index} is #{item}" }).to eql(@array)
        expect(empty_array).to eql(["In 0 is 1","In 1 is 2","In 2 is 3"])
      end
    end
  end
  
  describe "#my_select" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_select).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_select { |item| item.odd? }).to eql([1,3])
      end
    end
  end
  
  describe "#my_all?" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_all?).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_all? { |item| item > 5 }).to eql(false)
      end
      it "return the result of the block" do
        expect(@array.my_all? { |item| item < 5 }).to eql(true)
      end
    end
  end
  
  describe "#my_any?" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_any?).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_any? { |item| item > 3 }).to eql(false)
      end
      it "return the result of the block" do
        expect(@array.my_any? { |item| item < 2 }).to eql(true)
      end
    end
  end
  
  describe "#my_none?" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_none?).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_none? { |item| item > 3 }).to eql(true)
      end
      it "return the result of the block" do
        expect(@array.my_none? { |item| item < 2 }).to eql(false)
      end
    end
  end
  
  describe "#my_count" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_count).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_count { |item| item < 3 }).to eql(2)
      end
    end
  end
  
  describe "#my_map" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_map).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_map { |item| item * 2 }).to eql([2,4,6])
      end
    end
  end
  
  describe "#my_inject" do
    context "without block" do
      it "return an Massage 'No block implemented'" do
        expect(@array.my_inject).to be_a Enumerator
      end
    end
    context "with block" do
      it "return the result of the block" do
        expect(@array.my_inject { |result, item| result * item }).to eql(6)
      end
    end
  end
  
  describe "#my_map_proc(proc)" do
    context "with block" do
      it "return the result of the block" do
        proc = Proc.new { |item| item * item }
        expect(@array.my_map_proc(proc)).to eql([1,4, 9])
      end
    end
  end
    
end
