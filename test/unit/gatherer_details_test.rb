# coding: utf-8

require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererDetailsTest < ActiveSupport::TestCase

  include Gatherer
  
  ACCORDER_PALADIN_IDENTIFIER = 213818
  AETHER_CHARD_IDENTIFIER     = 12425
  BIORHYTHM_IDENTIFIER        = 39913
  DOOM_CANNON_IDENTIFIER      = 40197
  BLACK_LOTUS_IDENTIFIER      = 600
  
  test "should return detailed information of the Accorder Paladin card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(ACCORDER_PALADIN_IDENTIFIER)
      card = scraper.get_card_details
      assert_equal cards(:accorder_paladin), card
    end
  end
  
  test "should return detailed information of the the Æther Charge card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(AETHER_CHARD_IDENTIFIER)
      card = scraper.get_card_details
      assert_equal cards(:aether_charge), card
    end
  end
  
  test "should return detailed information of the the Biorhythm card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(BIORHYTHM_IDENTIFIER)
      card = scraper.get_card_details
      assert_equal cards(:biorhythm), card
    end
  end
  
  test "should return detailed information of the the Doom Cannon card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(DOOM_CANNON_IDENTIFIER)
      card = scraper.get_card_details
      assert_equal cards(:doom_cannon), card
    end
  end  
      
  test "should return detailed information of the the Black Lotus card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(BLACK_LOTUS_IDENTIFIER)
      card = scraper.get_card_details
      assert_equal cards(:black_lotus), card
    end
  end  
      
end