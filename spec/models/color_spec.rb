require 'spec_helper'

describe Color do

  it { should respond_to(:identifier,
                         :name) }

  context "without required attributes" do
    it "fails validation" do
      subject.should have(1).error_on(:identifier)
      subject.should have(1).error_on(:name)
    end
    
  end

  context "with duplicate name and identifier" do
    before { @duplicate_color = Factory.create(:color) }

    subject do
      Factory.build(:color, :name => @duplicate_color.name, :identifier => @duplicate_color.identifier)
    end

    it "fails validation" do
      subject.should have(1).error_on(:identifier) 
      subject.should have(1).error_on(:name)
    end
  end
end
