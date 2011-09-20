require 'spec_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'


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
  
  context "without required attributes" do    
    it "fails validation" do
      subject.should have(1).error_on(:name)
      subject.should have(1).error_on(:identifier)
    end
  end
  
  context "with a duplicate identifier" do
    
   before { @duplicate_card = Factory.create(:card) }
    
    subject do 
      Factory.build(:card, 
                    :identifier => @duplicate_card.identifier) 
    end
    
    it "fails validation" do
      subject.should have(1).error_on(:identifier)
    end      
  end
  
  context "with required attributes" do
   
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
  
    it "should be able to remove mana symbol from card" do
      expect{ subject.card_mana.first.destroy }.to change{ subject.mana.all.count }.by(-1)
    end

    it "should not remove mana symbol from database when removing mana symbol from card" do
      expect{ subject.card_mana.first.destroy }.to change{ Mana.all.count }.by(0)
    end 
  
  end 

end
