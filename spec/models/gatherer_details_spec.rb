# coding: utf-8 
require 'spec_helper'
require 'nokogiri'
require 'open-uri'

require 'gatherer'

describe Gatherer::DetailsPage do
  
  use_vcr_cassette 'detail_pages'

  context "with a name present" do
    
    subject { Gatherer::DetailsPage.new(213818) } 

    it "should return the name" do
      subject.name_on_page.should eq('Accorder Paladin') 
    end

    it "should return the mana cost" do
      subject.converted_mana_cost_on_page.should eq(2)
    end
     
    it "should return the strength" do
      subject.power_on_page.should eq(3)
    end

    it "should return the toughness" do
      subject.toughness_on_page.should eq(1)
    end

    it "should return the type" do
      subject.type_on_page.should eq("Creature — Human Knight")
    end
   
    it "should return the artist" do
      subject.artist_on_page.should eq("Kekai Kotaki")
    end



  end    


end
