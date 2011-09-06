require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererScraperTest < ActiveSupport::TestCase

  include Factory::Syntax::Methods

  include Gatherer

  test "should scrape details for all cards present in checklist" do
    scraper = Gatherer::Scraper.new('Foo')
    scraper.stubs(:card_identifiers_for_set).returns([1,2,3,4,5])
    scraper.stubs(:get_card).returns(build(:card))
    Scraper.expects(:get_card).times(5).returns(build(:card))
    
    
    scraped_cards = scraper.perform
    
    assert_not_nil scraped_cards
    assert_equal 5, scraped_cards.size
  end

  test "should return empty array when no identifiers are found" do
    scraper = Gatherer::Scraper.new('Foo')
    scraper.stubs(:card_identifiers_for_set).returns([])
    scraper.stubs(:get_card).returns(Factory.build(:card))
    
    scraped_cards = scraper.perform
    
    assert_not_nil scraped_cards
    assert_equal 0, scraped_cards.size
  end  
  
end