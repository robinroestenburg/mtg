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

  context "with an image" do
    
    subject do 
      Factory.build(:card, 
                     :card_image => Factory.build(:card_image)) 
    end  

    it "destroys image when destroyed" do
      image = subject.card_image
      subject.destroy
      image.should be_destroyed
    end
  end

  context "with mana symbols" do
  
    subject do
      card = Factory.create(:card)
      card.card_mana << Factory.create(:card_mana, 
                                       :mana_order => 2,
				       :mana => Factory.create(:mana, 
							       :code => '1'))
      card.card_mana << Factory.create(:card_mana, 
				       :mana_order => 1,
				       :mana => Factory.create(:mana,
							       :code => 'W'))
      card.save
      card
    end

    it "has an ordered list of mana symbols" do
      subject.card_mana[0].mana.code.should eq('W')
      subject.card_mana[1].mana.code.should eq('1')
    end
  end 
end
