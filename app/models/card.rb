class Card < ActiveRecord::Base

  validates_presence_of :name, :identifier
  validates_uniqueness_of :identifier

  serialize :description
  serialize :flavor

  has_one :card_image, :dependent => :destroy

  has_many :card_mana, :order => 'mana_order ASC'
  has_many :mana, :through => :card_mana, 
                  :order => 'card_manas.mana_order ASC'
                    
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

