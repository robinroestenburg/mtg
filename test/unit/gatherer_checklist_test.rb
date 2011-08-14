require 'test_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

class GathererTest < ActiveSupport::TestCase

  include Gatherer

  setup :initialize_html

  test "should return all cards on the checklist for Mirrodin Besieged" do
    scraper = Gatherer::CheckList.new
    identifiers = scraper.get_card_identifiers(Nokogiri::HTML(@mirrodin_besieged_html))
    assert_equal 155, identifiers.size, "Did not return all card identifiers"
  end

  test "should return all cards on the checklist for Urza's Saga" do
    scraper = Gatherer::CheckList.new
    identifiers = scraper.get_card_identifiers(Nokogiri::HTML(@urzas_saga_html))
    assert_equal 350, identifiers.size, "Did not return all card identifiers"
  end

  private

    def initialize_html
      VCR.use_cassette('checklist_pages',
                       :record => :new_episodes) do
        @mirrodin_besieged_html = open('http://gatherer.wizards.com/Pages/Search/Default.aspx?output=checklist&set=[%22Mirrodin%20Besieged%22]')
        @urzas_saga_html = open('http://gatherer.wizards.com/Pages/Search/Default.aspx?output=checklist&set=[%22Urza%27s%20Saga%22]')
      end  
    end
end

