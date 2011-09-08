module Gatherer

  class Scraper < Struct.new(:set_name)
        
    def perform
       
      cards = []
      
      identifiers = card_identifiers_for_set(set_name)
      Rails.logger.debug "Parsed the checklist, found #{identifiers.size} identifiers."

      identifiers.each do |identifier| 
        card = get_card(identifier) 
        cards << card
        
        Rails.logger.debug "Processed card with identifier #{identifier}"
      end
      
      cards
    end
    
    private
     
    def card_identifiers_for_set(set_name)
      @checklist = CheckListPage.new(set_name)
      @checklist.get_card_identifiers
    end
    
    def get_card(identifier)
      details = DetailsPage.new(identifier)
      
      card       = details.get_card_details
      card.color = get_card_color(identifier)
      
      card
    end
    
    def get_card_color(identifier)
      @checklist.get_card_color(identifier)
    end
  end
end
