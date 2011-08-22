require 'test_helper'

class CardTest < ActiveSupport::TestCase
  
  
  test "should not save card without name" do
    card = Card.new

    assert !card.valid?, "Card without name"
  end

  test "should not save card without identifier" do
    card = Card.new
    card.name = "Foo"

    assert !card.valid?, "Card without identifier"
  end

  test "should not save card with duplicate identifier" do
    card = Card.new
    card.name       = "Foo"
    card.identifier = cards(:black_lotus).identifier

    assert !card.valid?, "Saved card with duplicate identifier"
  end

  # Tests concerning the CardImage attribute of the Card model. 

  test "should have a readable and writable cardimage attribute" do
    Card.respond_to? 'card_image'
    Card.respond_to? 'card_image='
  end
  
  test "should have the right cardimage" do
    card = cards(:black_lotus)
    assert_equal card_images(:black_lotus), card.card_image
  end
  
  test "should destroy associated cardimage" do
    card = cards(:black_lotus)
    card.destroy
  
    assert_raise(ActiveRecord::RecordNotFound) { 
      CardImage.find(card_images(:black_lotus)) 
    }
  end
  
  
  # Test concerning the CardMana and Mana association.
  test "should have a list of mana elements" do
    card = cards(:accorder_paladin)
    card.mana << manas(:one)
    card.mana << manas(:white)
    
    assert_equal 2, card.card_mana.size
  end
  
  test "should have an ordered list of mana elements" do
    card = cards(:accorder_paladin)
    card.card_mana.create(:mana_order => 2, :mana => manas(:white))
    card.card_mana.create(:mana_order => 1, :mana => manas(:one))
    
    assert_equal Mana.find_by_code('1'), card.card_mana[0].mana 
    assert_equal Mana.find_by_code('W'), card.card_mana[1].mana 
  end  
  
end



# == Schema Information
#
# Table name: cards
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  cost        :integer
#  strength    :integer
#  toughness   :integer
#  category    :string(255)
#  number      :integer
#  artist      :string(255)
#  rarity      :string(255)
#  description :string(255)
#  flavor      :string(255)
#  identifier  :integer
#

