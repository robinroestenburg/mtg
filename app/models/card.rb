class Card < ActiveRecord::Base

  serialize :description
  serialize :flavor

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
#

