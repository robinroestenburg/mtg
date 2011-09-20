require 'spec_helper'

describe Mana do

  it { should respond_to(:code) }

  context "without required attributes" do
    it "fails validation" do
      subject.should have(1).error_on(:code)
    end
    
  end

  context "with duplicate code" do
    before { @duplicate_mana = Factory.create(:mana) }

    subject do
      Factory.build(:mana, :code => @duplicate_mana.code)
    end

    it "fails validation" do
      subject.should have(1).error_on(:code) 
    end
  end
end
