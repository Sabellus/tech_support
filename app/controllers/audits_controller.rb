class AuditsController < ApplicationController
    def index
        case current_user.role
        when 'manager'
          @aud = TicketConversation.all
        when 'admin'
            @aud = TicketConversation.all
        #   binding.pry
        when 'client'
          @aud = TicketConversation.none
        else
          @aud = TicketConversation.none
        end
        @grouped = @aud.group_by { |el| el.audits }
        # binding.pry
      end
end