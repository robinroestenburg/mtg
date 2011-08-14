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
end
