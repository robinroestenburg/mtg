# coding: utf-8

require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererDetailsTest < ActiveSupport::TestCase

  include Gatherer
  
  setup :initialize_html
  
  test "should retun a Card containing the detailed information of the Accorder Paladin card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@accorder_paladin_printed_html))
    
    assert_equal  "Accorder Paladin",           card.name
    assert_equal  2,                            card.cost
    assert_equal  3,                            card.strength
    assert_equal  1,                            card.toughness
    assert_equal  "Creature — Human Knight",    card.category
    
  end
  
  private

    def initialize_html
      VCR.use_cassette('detail_pages',
                       :record => :new_episodes) do
        @accorder_paladin_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=213818')
        
        # Encoding test
        # @aether_charge_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=12425')
        
        # Dunno?
        # @biorhythm_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=39913')
      end  
    end
  
end