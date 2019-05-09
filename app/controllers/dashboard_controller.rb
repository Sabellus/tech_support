class DashboardController < ApplicationController
  def index
    case current_user.role
    when 'manager'
      @ticket_conversations = TicketConversation.where('manager_id IS NULL OR manager_id = ?', current_user.id)
    when 'client'
      @ticket_conversations = TicketConversation.where(client: current_user)
    else
      @ticket_conversations = TicketConversation.none
    end
  end
end
