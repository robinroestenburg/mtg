require 'net/http'

module Gatherer
  
  class CheckList
    
    # Processes a checklist page of a set and returns an array of cards.
    def get_card_identifiers(page)

      identifiers = []

      page.css(CSS_CARD_ROW).each do |row|
        identifier = get_card_identifier(row)
        identifiers << identifier
      end

      identifiers
    end

    private

      CSS_CARD_ROW = 'tr.cardItem'
      CSS_LINK_TO_CARD = 'td.name a'
    
      # Processes a row on a checklist page of a set and returns the identifier 
      # represented by that row.
      def get_card_identifier(row)
        card_link = row.at_css CSS_LINK_TO_CARD
        card_link['href'].slice(/\d+/)
      end
  
  end
  
  class Details
    
    
    def get_card_details(page)
      card              = Card.new
      card.name         = name_on_page(page)
      # card.cost         = converted_mana_cost_on_page(page)
      # card.strength     = power_on_page(page)
      # card.toughness    = toughness_on_page(page)
      # card.category     = type_on_page(page)
      
      card
    end
    
    
    private 
      
      ROW_IDENTIFIER = '#ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_'
            
      # Returns the name of the card if present on the page.
      def name_on_page(page) 
        name = page.at_css("#{ROW_IDENTIFIER}nameRow div.value")
        name.content.strip if name
      end
      
      # Returns the converted mana cost of the card if present on the page.  
      def converted_mana_cost_on_page(page)
        cost = page.at_css("#{ROW_IDENTIFIER}cmcRow div.value")
        cost.content.strip.to_i if cost
      end

      # Returns the power of the card if present on the page.  
      def power_on_page(page) 
        p_t = page.at_css("#{ROW_IDENTIFIER}ptRow div.value")
        p_t.content.strip.split(/\s\/\s/).first.to_i if p_t
      end

      # Returns the toughness of the card if present on the page.  
      def toughness_on_page(page)
        p_t = page.at_css("#{ROW_IDENTIFIER}ptRow div.value")
        p_t.content.strip.split(/\s\/\s/).last.to_i if p_t
      end

      # Returns the type of the card if present on the page.  
      def type_on_page(page)
        type = page.at_css("#{ROW_IDENTIFIER}typeRow div.value")
        type.content.strip if type
      end
      
  end
end
