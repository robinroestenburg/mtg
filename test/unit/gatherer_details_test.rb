# coding: utf-8

require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererDetailsTest < ActiveSupport::TestCase

  include Gatherer
  
  setup :initialize_html
  
  test "should return a card containing the detailed information of the Accorder Paladin card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@accorder_paladin_printed_html))
    
    assert_equal "Accorder Paladin",        card.name
    assert_equal 2,                         card.cost
    assert_equal 3,                         card.strength
    assert_equal 1,                         card.toughness
    assert_equal "Creature — Human Knight", card.category
    assert_equal 1,                         card.number
    assert_equal "Kekai Kotaki",            card.artist 
    assert_equal "Uncommon",                card.rarity    
    assert_equal [%Q[Battle cry <i>(Whenever this creature attacks, each other attacking creature gets +1/+0 until end of turn.)</i>]], 
                                            card.description
    assert_equal 1,                         card.description.size
    assert_equal [%Q[<i>"I fight for the suns, the surface, and everything in between."</i>]], 
                                            card.flavor
    assert_equal 1,                         card.flavor.size
  end
  
  test "should return a card containing the detailed information of the the Æther Charge card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@aether_charge_printed_html))
  
    assert_equal "Æther Charge",            card.name
    assert_equal 5,                         card.cost
    assert_nil   card.strength
    assert_nil   card.toughness
    assert_equal "Enchantment",             card.category
    assert_equal [%Q[Whenever a Beast comes into play under your control, you may have it deal 4 damage to target opponent.]], 
                                            card.description
    assert_equal 1,                         card.description.size                                            
    assert_equal [%Q[<i>"Is it just me, or does that meteor have teeth?"</i>]], 
                                            card.flavor
    assert_equal 1,                         card.flavor.size                                            
    assert_equal 184,                       card.number
    assert_equal "Mark Brill",              card.artist 
    assert_equal "Uncommon",                card.rarity
  end
  
  test "should return a card containing the detailed information of the the Biorythm card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@biorhythm_printed_html))
    
    assert_equal "Biorhythm",               card.name
    assert_equal 8,                         card.cost
    assert_nil   card.strength
    assert_nil   card.toughness
    assert_equal "Sorcery",                 card.category
    assert_equal [%Q[Each player's life total becomes the number of creatures he or she controls.]], 
                                            card.description
    assert_equal 1,                         card.description.size
    assert_equal [%Q[<i>"I have seen life's purpose, and now it is my own."</i>],
                  %Q[—Kamahl, druid acolyte]], 
                                            card.flavor
    assert_equal 2,                         card.flavor.size                                            
    assert_equal 247,                       card.number
    assert_equal "Ron Spears",              card.artist 
    assert_equal "Rare",                    card.rarity
  end
  
  test "should return a card containing the detailed information of the the Doom Cannon card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@doom_cannon_printed_html))
    
    assert_equal "Doom Cannon",             card.name
    assert_equal 6,                         card.cost
    assert_nil   card.strength
    assert_nil   card.toughness
    assert_equal "Artifact",                card.category
    assert_equal [%Q[As Doom Cannon comes into play, choose a creature type.],
                  %Q[o3, ocT, Sacrifice a creature of the chosen type: Doom Cannon deals 3 damage to target creature or player.]], 
                                            card.description
    assert_equal 2,                         card.description.size
    assert_nil   card.flavor
    assert_equal 307,                       card.number
    assert_equal "Matthew Mitchell",        card.artist 
    assert_equal "Rare",                    card.rarity
  end  
      
  test "should return a card containing the detailed information of the the Black Lotus card" do
    scraper = Gatherer::Details.new
    card = scraper.get_card_details(Nokogiri::HTML(@black_lotus_printed_html))
    
    assert_equal "Black Lotus",             card.name
    assert_equal 0,                         card.cost
    assert_nil   card.strength
    assert_nil   card.toughness
    assert_equal "Mono Artifact",           card.category
    assert_equal [%Q[Adds 3 mana of any single color of your choice to your mana pool, then is discarded. Tapping this artifact can be played as an interrupt.]], 
                                            card.description
    assert_equal 1,                         card.description.size
    assert_nil   card.flavor
    assert_nil   card.number
    assert_equal "Christopher Rush",        card.artist 
    assert_equal "Rare",                    card.rarity
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