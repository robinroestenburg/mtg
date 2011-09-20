class Color < ActiveRecord::Base

  validates_presence_of :name, :identifier
  validates_uniqueness_of :name, :identifier

end

# == Schema Information
#
# Table name: colors
#
#  id         :integer         not null, primary key
#  identifier :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

