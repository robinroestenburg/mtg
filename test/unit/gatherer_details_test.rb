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
    checklist = nil
    VCR.use_cassette('checklist_pages') do
      checklist = Gatherer::CheckListPage.new("Mirrodin Besieged")
    end
    
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(ACCORDER_PALADIN_IDENTIFIER)
      card = scraper.get_card_details
      card.color = checklist.get_card_color(card.identifier)
      assert_card_equal cards(:accorder_paladin), card
    end
  end
  
  test "should return detailed information of the the Æther Charge card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(AETHER_CHARD_IDENTIFIER)
      card = scraper.get_card_details
      card.color = Color.find_by_identifier('R')
      assert_card_equal cards(:aether_charge), card
    end
  end

  test "should return detailed information of the the Biorhythm card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(BIORHYTHM_IDENTIFIER)
      card = scraper.get_card_details
      card.color = Color.find_by_identifier('G')
      assert_card_equal cards(:biorhythm), card
    end
  end
  
  test "should return detailed information of the the Doom Cannon card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(DOOM_CANNON_IDENTIFIER)
      card = scraper.get_card_details
      assert_card_equal cards(:doom_cannon), card
    end
  end  
      
  test "should return detailed information of the the Black Lotus card" do
    VCR.use_cassette('detail_pages') do
      scraper = Gatherer::DetailsPage.new(BLACK_LOTUS_IDENTIFIER)
      card = scraper.get_card_details
      assert_card_equal cards(:black_lotus), card
    end
  end  

  def assert_card_equal(c, o, msg = nil)
    full_message = build_message(msg, "? is not equal to ?.", c, o)
    assert_block(full_message) do 
      c.name        == o.name &&
      c.cost        == o.cost &&
      c.strength    == o.strength &&
      c.toughness   == o.toughness &&
      c.category    == o.category && 
      c.number      == o.number && 
      c.artist      == o.artist && 
      c.description == o.description && 
      c.flavor      == o.flavor &&
      c.identifier  == o.identifier 
    end

    full_message = build_message(msg, "? is not equal to ?.", c.card_mana, o.card_mana)
    assert_block(full_message) do
      a = c.card_mana.map { |cm| [cm.mana_order, cm.mana.code] }
      b = o.card_mana.map { |cm| [cm.mana_order, cm.mana.code] }
      
      ((a | b) - (a & b)).empty?
    end

    full_message = build_message(msg, "? is not equal to ?.", c.rarity, o.rarity)
    assert_block(full_message) do
      (c.rarity.nil? && o.rarity.nil?) || 
      (c.rarity.name == o.rarity.name)
    end
    
    full_message = build_message(msg, "? is not equal to ?.", c.color, o.color)
    assert_block(full_message) do
      (c.color.nil? && o.color.nil?) || 
      (c.color.name == o.color.name)
    end
  end

end
