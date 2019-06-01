class UserConversationChannel < ApplicationCable::Channel
  def subscribed
   
  end

  def unsubscribed
    stop_all_streams
  end

  def receive(data)
    
  end
end
