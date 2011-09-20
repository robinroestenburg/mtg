require 'ostruct' 

module Gatherer

  class CheckListPage
    
    GATHERER_BASE = 'http://gatherer.wizards.com/Pages'

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
          get_card_identifier(row) == identifier
        end
      end
        
      def card_color_in_row(row) 
        cell = row.first.at_css(COLOR_OF_CARD)
        color_name = cell.content.strip
        if color_name
          color = OpenStruct.new({ :name => name, 
                                   :identifier => name.first })
        end  
      end  

  end
end
