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

