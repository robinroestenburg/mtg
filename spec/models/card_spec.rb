require 'spec_helper'

describe Card do

  it { should respond_to(:identifier, 
			 :name,
			 :cost, 
			 :strength,
			 :toughness,
			 :category,
			 :description,
			 :number,
			 :flavor,
                         :card_image,
		         :mana,
                         :color,
                         :rarity,
                         :card_mana) }  

  # FIXME: Not sure if this is possible!
  # it { should_not respond_to(:color_id, :rarity_id) } 
  
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
     
    before do 
      @white = Factory.create(:card_mana, :mana => Mana.find_by_code('W'))
      @one   = Factory.create(:card_mana, :mana => Mana.find_by_code('1'))
    end

    subject do
      card = Factory.build(:card)
      card.card_mana << @one 
      card.card_mana << @white
      card.save
      card
    end

    it "has an ordered list of mana symbols" do
      subject.mana.first.code.should eq('W')
      subject.mana.last.code.should eq('1')
    end
  end 

end
