class DashboardController < ApplicationController
  def index
    case current_user.role
    when 'manager'
      @ticket_conversations = TicketConversation.where('manager_id IS NULL OR manager_id = ?', current_user.id)
      # binding.pry
    when 'client'
      @ticket_conversations = TicketConversation.where(client: current_user)
    else
      @ticket_conversations = TicketConversation.none
    end
    @grouped = @ticket_conversations.group_by { |el| el.status }
    # binding.pry
  end
end
