require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererTest < ActiveSupport::TestCase

  include Gatherer

  test "should return all cards on the checklist for Mirrodin Besieged" do
    VCR.use_cassette('checklist_pages') do
      scraper = Gatherer::CheckListPage.new("Mirrodin Besieged")
      identifiers = scraper.get_card_identifiers
      assert_equal 155, identifiers.size, "Did not return all card identifiers"
    end
  end

  test "should return all cards on the checklist for Urza's Saga" do
    VCR.use_cassette('checklist_pages') do
      scraper = Gatherer::CheckListPage.new("Urza's Saga")
      identifiers = scraper.get_card_identifiers
      assert_equal 350, identifiers.size, "Did not return all card identifiers"
    end
  end

end

