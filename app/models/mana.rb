class Mana < ActiveRecord::Base
  
  validates_presence_of :code
  validates_uniqueness_of :code  
  
end

# == Schema Information
#
# Table name: manas
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

