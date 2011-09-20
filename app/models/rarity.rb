class Rarity < ActiveRecord::Base
  
  validates_presence_of :identifier, :name
  validates_uniqueness_of :identifier, :name
 
end

# == Schema Information
#
# Table name: rarities
#
#  id         :integer         not null, primary key
#  identifier :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

