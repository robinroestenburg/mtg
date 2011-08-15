# coding: utf-8

require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererDetailsTest < ActiveSupport::TestCase

  include Gatherer
  
  setup :initialize_html
  
  test "should return detailed information of the Accorder Paladin card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@accorder_paladin_printed_html))
    assert_equal cards(:accorder_paladin), card
  end
  
  test "should return detailed information of the the Æther Charge card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@aether_charge_printed_html))
    assert_equal cards(:aether_charge), card
  end
  
  test "should return detailed information of the the Biorhythm card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@biorhythm_printed_html))
    assert_equal cards(:biorhythm), card
  end
  
  test "should return detailed information of the the Doom Cannon card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@doom_cannon_printed_html))
    assert_equal cards(:doom_cannon), card
  end  
      
  test "should return detailed information of the the Black Lotus card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@black_lotus_printed_html))
    assert_equal cards(:black_lotus), card
  end  
      
  private

    def initialize_html
      VCR.use_cassette('detail_pages',
                       :record => :new_episodes) do
        @accorder_paladin_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=213818')
        @aether_charge_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=12425')
        @biorhythm_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=39913')
        @doom_cannon_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=40197')
        @black_lotus_printed_html = open('http://gatherer.wizards.com/Pages/Card/Details.aspx?printed=true&multiverseid=600')
      end  
    end
  
end