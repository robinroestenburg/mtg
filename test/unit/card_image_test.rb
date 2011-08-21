require 'test_helper'

class CardImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

