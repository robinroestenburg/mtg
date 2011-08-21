class CardImage < ActiveRecord::Base
      
  belongs_to :card
  
end

# == Schema Information
#
# Table name: card_images
#
#  id           :integer         not null, primary key
#  size         :integer
#  data         :binary
#  content_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  card_id      :integer
#

