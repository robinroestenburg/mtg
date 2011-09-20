require 'spec_helper'

describe Rarity do

  it { should respond_to(:identifier,
                         :name) }

  context "without required attributes" do
    it "fails validation" do
      subject.should have(1).error_on(:identifier)
      subject.should have(1).error_on(:name)
    end
    
  end

  context "with duplicate name and identifier" do
    before { @duplicate_rarity = Factory.create(:rarity) }

    subject do
      Factory.build(:rarity, :name => @duplicate_rarity.name, :identifier => @duplicate_rarity.identifier)
    end

    it "fails validation" do
      subject.should have(1).error_on(:identifier) 
      subject.should have(1).error_on(:name)
    end
  end
end
