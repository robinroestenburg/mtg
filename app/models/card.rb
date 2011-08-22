class Card < ActiveRecord::Base

  validates_presence_of :name, :identifier
  validates_uniqueness_of :identifier

  serialize :description
  serialize :flavor

  has_one :card_image, :dependent => :destroy

  has_many :card_mana
  has_many :mana, :through => :card_mana
  

  def ==(o)
    name        == o.name && 
    cost        == o.cost && 
    strength    == o.strength && 
    toughness   == o.toughness &&
    category    == o.category && 
    number      == o.number && 
    artist      == o.artist && 
    rarity      == o.rarity && 
    description == o.description && 
    flavor      == o.flavor &&
    identifier  == o.identifier
  rescue
    false
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

