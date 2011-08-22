class CardMana < ActiveRecord::Base
  
  belongs_to :card
  belongs_to :mana
  
end


# == Schema Information
#
# Table name: card_manas
#
#  id         :integer         not null, primary key
#  mana_order :integer
#  created_at :datetime
#  updated_at :datetime
#  card_id    :integer
#  mana_id    :integer
#

