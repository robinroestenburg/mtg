require 'test_helper'

class CardTest < ActiveSupport::TestCase
  include Factory::Syntax::Methods
  
  # Tests concerning the CardImage attribute of the Card model. 

  test "should have a readable and writable cardimage attribute" do
    Card.respond_to? 'card_image'
    Card.respond_to? 'card_image='
  end

  # Test concerning the CardMana and Mana association.
  test "should have a ordered list of mana elements" do
     card = Card.create(name: 'Foo', identifier: 1234)
     card.card_mana.create(:mana_order => 2, :mana => manas(:white))
     card.card_mana.create(:mana_order => 1, :mana => manas(:one))
     
     assert_equal Mana.find_by_code('1'), card.mana[0] 
     assert_equal Mana.find_by_code('W'), card.mana[1]
   end
  
  test "should have an ordered list of mana elements" do
    card = Card.create(name: 'Foo', identifier: 1234)
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
#  description :string(255)
#  flavor      :string(255)
#  identifier  :integer
#  color_id    :integer
#  rarity_id   :integer
#

