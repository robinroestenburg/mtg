require 'net/http'
require 'uri'

module Gatherer
  
  class CheckListPage
    
    def initialize(set_name)
      @page = 
        Nokogiri::HTML(
          open("#{GATHERER_BASE}/Search/Default.aspx?output=checklist&set=[%22" + URI.escape(set_name) + "%22]"))
    end
    
    def get_card_identifiers
      @page.css(CARD_ROW).map { |row| get_card_identifier(row) }
    end
    
    def get_card_color(identifier)
      row = row_for_identifier(identifier)   
      card_color_in_row(row)
    end
    
    private

      CARD_ROW = 'tr.cardItem'
      LINK_TO_CARD = 'td.name a'
      COLOR_OF_CARD = 'td.color'

      def get_card_identifier(row)
        card_link = row.at_css(LINK_TO_CARD)
        card_link[:href].slice(/\d+/)
      end
      
      def row_for_identifier(identifier)
        @page.css(CARD_ROW).select do |row| 
          get_card_identifier(row).to_i == identifier
        end
      end
        
      def card_color_in_row(row) 
        color = row.first.at_css(COLOR_OF_CARD)
        color.content.strip if color  
      end  
  end
  
  class DetailsPage
    
    def initialize(identifier)
      @identifier = identifier
      @page = 
        Nokogiri::HTML(
          open("#{GATHERER_BASE}/Card/Details.aspx?printed=true&multiverseid=" + @identifier.to_s))
    end
        
    def get_card_details
      card              = Card.new
      card.identifier   = @identifier
      card.name         = name_on_page
      card.cost         = converted_mana_cost_on_page
      card.strength     = power_on_page
      card.toughness    = toughness_on_page
      card.category     = type_on_page
      card.artist       = artist_on_page
      card.number       = number_on_page
      card.rarity       = rarity_on_page
      card.description  = rules_text_on_page
      card.flavor       = flavor_text_on_page
      card.card_mana    = card_mana_on_page
            
      card
    end
    
    private 
      
      ROW_IDENTIFIER = '#ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_'
            
      def name_on_page
        name = @page.at_css("#{ROW_IDENTIFIER}nameRow div.value")
        name.content.strip if name
      end
      
      def converted_mana_cost_on_page
        cost = @page.at_css("#{ROW_IDENTIFIER}cmcRow div.value")
        cost.content.strip.to_i if cost
      end

      def power_on_page
        p_t = @page.at_css("#{ROW_IDENTIFIER}ptRow div.value")
        p_t.content.strip.split(/\s\/\s/).first.to_i if p_t
      end

      def toughness_on_page
        p_t = @page.at_css("#{ROW_IDENTIFIER}ptRow div.value")
        p_t.content.strip.split(/\s\/\s/).last.to_i if p_t
      end

      def type_on_page
        type = @page.at_css("#{ROW_IDENTIFIER}typeRow div.value")
        type.content.strip if type
      end
      
      def artist_on_page
        artist = @page.at_css("#{ROW_IDENTIFIER}artistRow div.value")
        artist.content.strip if artist
      end

      def number_on_page
        number = @page.at_css("#{ROW_IDENTIFIER}numberRow div.value")
        number.content.strip.to_i if number
      end

      def rarity_on_page
        rarity = @page.at_css("#{ROW_IDENTIFIER}rarityRow div.value span")
        rarity.content.strip if rarity
      end
      
      def rules_text_on_page
        lines = []
        @page.css("#{ROW_IDENTIFIER}textRow div.cardtextbox").each { |row| 
          lines << row.inner_html
        }

        lines if lines.size > 0
      end

      def flavor_text_on_page
        lines = []
        @page.css("#{ROW_IDENTIFIER}flavorRow div.cardtextbox").each { |row|  
          lines << row.inner_html
        }

        lines if lines.size > 0
      end      
      
      def card_mana_on_page
        card_manas = []
        @page.css(mana_images).each_with_index do |img, index|
          mana_code = determine_mana_code(img)  
          card_mana = create_card_mana(mana_code, index)
          card_manas << card_mana
        end
        card_manas
      end      
      
      def mana_images 
        "#{row_identifier}manaRow div.value img"
      end
      
      def determine_mana_code(img)
        img[:alt].first
      end
      
      def create_card_mana(code, index)
        card_mana = CardMana.new
        card_mana.mana_order = index
        card_mana.mana = 
          Mana.find_by_code(code) || Mana.create!(code: code)
        
        card_mana
      end
      
      def row_identifier 
        '#ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_'      
      end
  end
  
  private
   
    GATHERER_BASE = 'http://gatherer.wizards.com/Pages'
end
