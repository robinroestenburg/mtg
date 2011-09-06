require 'spec_helper'

describe Card do
    
  context "without a name and an identifier" do
    
    it "fails validation" do
      subject.should have(1).error_on(:name)
      subject.should have(1).error_on(:identifier)
    end
  
  end
  
  context "with a duplicate identifier" do
    
    before { @duplicate_card = Factory.create(:card, :identifier => 42) }
    
    subject do 
      Factory.build(:card, 
                    :identifier => @duplicate_card.identifier) 
    end
    
    it "fails validation" do
      subject.should have(1).error_on(:identifier)
    end      
        
  end
  
  context "with a name and an identifier" do
  
    subject { Factory.build(:card) }
  
    it "passes validation" do
      subject.should have(0).errors_on(:name)
      subject.should have(0).errors_on(:identifier)
    end

  end
    
  
end